import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Tezos.pb.dart' as Tezos;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  group('TezosCompiler', () {
    const coin = TWCoinType.TWCoinTypeTezos;

    test('Sign', () {
      /// Step 1: Prepare transaction input (protobuf)
      final privateKey = TWPrivateKey.createWithHexString(
          '2e8905819b8723fe2c1d161860e5ee1830318dbf49a83bd451cfb8440c28bd6f');
      final publicKey = privateKey.getPublicKey(coin);
      final revealKey = parse_hex(
          "311f002e899cdd9a52d96cb8be18ea2bbab867c505da2b44ce10906f511cff95");

      final input = Tezos.SigningInput(
        operationList: Tezos.OperationList(
          branch: 'BL8euoCWqNCny9AR3AKjnpi38haYMxjei1ZqNHuXMn19JSQnoWp',
          operations: [
            Tezos.Operation(
              revealOperationData: Tezos.RevealOperationData(
                publicKey: revealKey,
              ),
              source: 'tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW',
              fee: $fixnum.Int64(1272),
              counter: $fixnum.Int64(30738),
              gasLimit: $fixnum.Int64(10100),
              storageLimit: $fixnum.Int64(257),
              kind: Tezos.Operation_OperationKind.REVEAL,
            ),
            Tezos.Operation(
              transactionOperationData: Tezos.TransactionOperationData(
                amount: $fixnum.Int64(1),
                destination: 'tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW',
              ),
              source: 'tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW',
              fee: $fixnum.Int64(1272),
              counter: $fixnum.Int64(30739),
              gasLimit: $fixnum.Int64(10100),
              storageLimit: $fixnum.Int64(257),
              kind: Tezos.Operation_OperationKind.TRANSACTION,
            ),
          ],
        ),
      );

      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '12e4f8b17ad3b316a5a56960db76c7d6505dbf2fff66106be75c8d6753daac0e');

      final signature = parse_hex(
          "0217034271b815e5f0c0a881342838ce49d7b48cdf507c72b1568c69a10db70c987"
          "74cdad1a74df760763e25f760ff13afcbbf3a1f2c833a0beeb9576a579c05");

      /// Step 3: Compile transaction info
      final tx =
          "3756ef37b1be849e3114643f0aa5847cabf9a896d3bfe4dd51448de68e91da016b0081faa75f741ef614b0e35f"
          "cc8c90dfa3b0b95721f80992f001f44e810200311f002e899cdd9a52d96cb8be18ea2bbab867c505da2b44ce10"
          "906f511cff956c0081faa75f741ef614b0e35fcc8c90dfa3b0b95721f80993f001f44e810201000081faa75f74"
          "1ef614b0e35fcc8c90dfa3b0b95721000217034271b815e5f0c0a881342838ce49d7b48cdf507c72b1568c69a1"
          "0db70c98774cdad1a74df760763e25f760ff13afcbbf3a1f2c833a0beeb9576a579c05";
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [],
      );

      {
        final output = Tezos.SigningOutput.fromBuffer(outputData);

        expect(hex(output.encoded), tx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Tezos.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = privateKey.data;

        final output = Tezos.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), tx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [],
        );
        final output = Tezos.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });
  });
}

import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Tezos.pb.dart' as Tezos;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('TezosCompiler', () {
    const coin = TWCoinType.Tezos;

    test('CompileWithSignatures', () {
      // Test key
      final privateKey = TWPrivateKey.createWithHexString(
          '2e8905819b8723fe2c1d161860e5ee1830318dbf49a83bd451cfb8440c28bd6f');

      // This is the forged (non-base58) reveal public key bytes used in older golden vectors.
      // It corresponds to edpk "edpku9ZF6UUAEo1AL3NWy1oxHLL6AfQcGYwA5hFKrEKVHMT3Xx889A"
      final revealKey = parse_hex(
          "311f002e899cdd9a52d96cb8be18ea2bbab867c505da2b44ce10906f511cff95");

      final input = Tezos.SigningInput(
        operationList: Tezos.OperationList(
          branch: 'BL8euoCWqNCny9AR3AKjnpi38haYMxjei1ZqNHuXMn19JSQnoWp',
          operations: [
            // REVEAL (must come before any other manager ops for the same source)
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
            // TRANSACTION
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
      // This expected hash should remain stable given the fixed inputs above.
      expect(hex(preImageHash),
          '2268aec5a2becbcd784a03060a4816e20396e6d96e7839ddaf2c3b980632e591');

      // Produce a proper 64-byte Ed25519 signature (R||S) over the preimage hash.
      final signature = privateKey.sign(
        Uint8List.fromList(preImageHash),
        TWCurve.ED25519,
      );
      expect(signature.length, 64);

      // -------- Step 3: Compile transaction using that signature
      const tx =
          "3756ef37b1be849e3114643f0aa5847cabf9a896d3bfe4dd51448de68e91da016b0081faa75f741ef614b0e35f"
          "cc8c90dfa3b0b95721f80992f001f44e810200311f002e899cdd9a52d96cb8be18ea2bbab867c505da2b44ce10"
          "906f511cff956c0081faa75f741ef614b0e35fcc8c90dfa3b0b95721f80993f001f44e810201000081faa75f74"
          "1ef614b0e35fcc8c90dfa3b0b95721000217034271b815e5f0c0a881342838ce49d7b48cdf507c72b1568c69a1"
          "0db70c98774cdad1a74df760763e25f760ff13afcbbf3a1f2c833a0beeb9576a579c05";
      var compiledData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [],
      );
      final compiledOutput = Tezos.SigningOutput.fromBuffer(compiledData);
      final compiledHex = hex(compiledOutput.encoded);

      // As a cross-check, sign the same input with AnySigner and compare full bytes.
      final signingInput = Tezos.SigningInput.fromBuffer(txInputData);
      signingInput.privateKey = privateKey.data;

      {
        final output = signingInput.sign();
        final anySignHex = hex(output.encoded);

        expect(compiledHex, anySignHex);
      }

      // -------- Structural Seoul check:
      // Ensure the reveal has the new presence_of_proof byte (0x00) after the forged public key,
      // followed by the transaction op tag (0x6c).

      {
        // Reveal tag = 0x6b, Transaction tag = 0x6c
        expect(compiledHex.contains('6b'), true);

        final forgedPubKeyHex = hex(revealKey);
        final pkPos = compiledHex.indexOf(forgedPubKeyHex);
        expect(pkPos, isNot(-1));

        // presence_of_proof = 0x00 must be immediately after the public key bytes
        expect(
          compiledHex.substring(pkPos + forgedPubKeyHex.length,
              pkPos + forgedPubKeyHex.length + 2),
          '00',
        );

        // and the next op tag should be 0x6c (transaction)
        expect(
          compiledHex.substring(pkPos + forgedPubKeyHex.length + 2,
              pkPos + forgedPubKeyHex.length + 4),
          '6c',
        );
      }

      // -------- Negative: inconsistent signatures & public keys count
      {
        final compiledBad = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [],
        );
        final badOutput = Tezos.SigningOutput.fromBuffer(compiledBad);
        expect(badOutput.encoded.length, 0);
        expect(badOutput.error, Common.SigningError.Error_signatures_count);
      }
    });
  });
}

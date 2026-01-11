import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Oasis.pb.dart' as Oasis;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  const coin = TWCoinType.Oasis;

  group('OasisCompiler', () {
    test('CompileWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      final privateKey = TWPrivateKey.createWithHexString(
          '4f8b5676990b00e23d9904a92deb8d8f428ff289c8939926358f1d20537c21a0');
      final publicKey = privateKey.getPublicKey(coin);

      final input = Oasis.SigningInput(
        transfer: Oasis.TransferMessage(
          gasPrice: $fixnum.Int64(0),
          gasAmount: '0',
          nonce: $fixnum.Int64(0),
          to: 'oasis1qrrnesqpgc6rfy2m50eew5d7klqfqk69avhv4ak5',
          amount: '10000000',
          context:
              'oasis-core/consensus: tx for chain a245619497e580dd3bc1aa3256c07f68b8dcc13f92da115eadc3b231b083d3c4',
        ),
        privateKey: privateKey.data,
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
          '373976e01fa0634a40ce8898a869f1056d862e3a0f26d8ae22ebeb5fdbcde9b3');

      final signature = parse_hex(
          "6e51c18c9b2015c9b49414b3307336597f51ff331873d214ce2db81c9651a34d99529ccaa294a39ccd01c6b0bc2c2239d87c624e5ba4840cf99ac8f9283e240c");

      /// Step 3: Compile transaction info
      const expectedTx =
          "a2697369676e6174757265a2697369676e617475726558406e51c18c9b2015c9b49414b3307336597f51ff331873d214ce2db81c9651a34d99529ccaa294a39ccd01c6b0bc2c2239d87c624e5ba4840cf99ac8f9283e240c6a7075626c69635f6b6579582093d8f8a455f50527976a8aa87ebde38d5606efa86cb985d3fb466aff37000e3b73756e747275737465645f7261775f76616c7565585ea463666565a2636761730066616d6f756e74410064626f6479a262746f5500c73cc001463434915ba3f39751beb7c0905b45eb66616d6f756e744400989680656e6f6e636500666d6574686f64707374616b696e672e5472616e73666572";
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );

      {
        final output = Oasis.SigningOutput.fromBuffer(outputData);

        expect(hex(output.encoded), expectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Oasis.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = privateKey.data;

        final output = Oasis.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), expectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Oasis.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Oasis.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}

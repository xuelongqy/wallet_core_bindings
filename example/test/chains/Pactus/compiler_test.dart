import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Pactus.pb.dart' as Pactus;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TxCompiler;

import '../../utils.dart';
import 'test_cases.dart';

void main() {
  initTest();
  group('PactusCompiler', () {
    test('CompileAndSign', () {
      for (final testCase in TEST_CASES) {
        final input = testCase.createSigningInput();
        final inputData = input.writeToBuffer();

        // Pre-hash the transaction.
        final preImageHashesData = TWTransactionCompiler.preImageHashes(
          TWCoinType.Pactus,
          inputData,
        );
        final preSigningOutput =
            TxCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
        final actualDataToSign = Uint8List.fromList(preSigningOutput.data);

        expect(preSigningOutput.error, Common.SigningError.OK);
        expectHex(actualDataToSign, testCase.dataToSign);

        // Sign the pre-hash data.
        final privateKey = TWPrivateKey.createWithHexString(PRIVATE_KEY_HEX);
        final publicKey =
            privateKey.getPublicKeyByType(TWPublicKeyType.ED25519).data;
        final signature = privateKey.sign(actualDataToSign, TWCurve.ED25519);
        expectHex(signature, testCase.signature);

        // Compile the transaction.
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: TWCoinType.Pactus,
          txInputData: inputData,
          signatures: [signature],
          publicKeys: [publicKey],
        );
        final output = Pactus.SigningOutput.fromBuffer(outputData);

        expect(output.error, Common.SigningError.OK);
        expectHex(output.signedTransactionData, testCase.signedData);
        expectHex(output.signature, testCase.signature);
        expectHex(output.transactionId, testCase.transactionID);
      }
    });
  });
}

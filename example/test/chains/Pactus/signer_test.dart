import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Pactus.pb.dart' as Pactus;

import '../../utils.dart';
import 'test_cases.dart';

void main() {
  initTest();
  group('PactusSigner', () {
    test('Sign', () {
      for (final testCase in TEST_CASES) {
        final input = testCase.createSigningInput();

        final privateKey = TWPrivateKey.createWithHexString(PRIVATE_KEY_HEX);
        input.privateKey = privateKey.data;

        final output = Pactus.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), TWCoinType.Pactus));

        expect(output.error, Common.SigningError.OK);
        expectHex(output.signedTransactionData, testCase.signedData);
        expectHex(output.signature, testCase.signature);
        expectHex(output.transactionId, testCase.transactionID);
      }
    });
  });
}

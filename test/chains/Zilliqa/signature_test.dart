import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('ZilliqaSignature', () {
    test('Signing', () {
      final keyData = parse_hex(
          '0xafeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');
      final privateKey = TWPrivateKey.createWithData(keyData);
      final pubKey = privateKey.getPublicKeySecp256k1(true);

      final message = 'hello schnorr';
      final messageData = message.codeUnits;
      final signatureData =
          privateKey.signZilliqaSchnorr(Uint8List.fromList(messageData));

      expect(
        pubKey.verifyZilliqaSchnorr(
          signature: signatureData,
          message: Uint8List.fromList(messageData),
        ),
        true,
      );
      expect(hex(signatureData),
          'd166b1ae7892c5ef541461dc12a50214d0681b63d8037cda29a3fe6af8bb973e4ea94624d85bc0010bdc1b38d05198328fae21254adc2bf5feaf2804d54dba55');
    });
  });
}

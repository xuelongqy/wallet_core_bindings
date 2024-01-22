import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWAsnParser, () {
    test('EcdsaSignatureFromDer', () {
      final encoded = TWData.createWithHexString(
          '3046022100db421231f23d0320dbb8f1284b600cd34b8e9218628139539ff4f1f6c05495da022100ff715aab70d5317dbf8ee224eb18bec3120cfb9db1000dbb31eadaf96c71c1b1');
      final decodedResult =
          TWString.createWithHexData(TWAsnParser.ecdsaSignatureFromDer(encoded))
              .toString();
      expect(decodedResult,
          'db421231f23d0320dbb8f1284b600cd34b8e9218628139539ff4f1f6c05495daff715aab70d5317dbf8ee224eb18bec3120cfb9db1000dbb31eadaf96c71c1b1');

      final invalid = TWData.createWithHexString('');
      expect(TWAsnParser.ecdsaSignatureFromDer(invalid).pointer, nullptr);
    });
  });
}

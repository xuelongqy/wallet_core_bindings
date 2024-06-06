import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('NULSAddress', () {
    const coin = TWCoinType.NULS;

    test('StaticInvalid', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(TWAnyAddress.isValid('tNULSe', coin), false);
      expect(
        TWAnyAddress.isValid('aaeb60f3e94c9b9a09f33669435e7ef1beaed', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('NULSd6HgbwcM8wz48f6UkFYHLVriT1L81X9z', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('NULSd6HgUxmcJWc88iELEJ7RH9XHsazBQqnJc', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('NULSd6HgbwcM8wz48f6UkFYHLVriT1L81X9z2', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('tNULSeBaMtdtUNbnNBZ5RoFoh3fHrrrm6dVZLH', coin),
        true,
      );
    });

    test('FromString', () {
      final address =
          TWAnyAddress('NULSd6HgbwcM8wz48f6UkFYHLVriT1L81X9z2', coin);
      expect(address.description, 'NULSd6HgbwcM8wz48f6UkFYHLVriT1L81X9z2');
      final address2 =
          TWAnyAddress('tNULSeBaMtdtUNbnNBZ5RoFoh3fHrrrm6dVZLH', coin);
      expect(address2.description, 'tNULSeBaMtdtUNbnNBZ5RoFoh3fHrrrm6dVZLH');
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a1269039e4ffdf43687852d7247a295f0b5bc55e6dda031cffaa3295ca0a9d7a');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'NULSd6HghWa4CN5qdxqMwYVikQxRZyj57Jn4L');
    });

    test('FromCompressedPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
          '0244d50ff36c3136b4bf81f0c74b066695bc2af43e28d7f0ca1d48fcfd084bea66',
          TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'NULSd6HgUiMKPNi221bPfqvvho8QpuYBvn1x3');
    });

    test('FromPrivateKey33', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'd77580833f0b3c35b7114c23d6b66790d726c308baf237ec8c369152f2c08d27');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'NULSd6HgXx8YkwEjePLWUmdRSZzPQzK6BXnsB');
    });
  });
}

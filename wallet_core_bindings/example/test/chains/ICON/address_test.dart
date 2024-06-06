import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('IconAddress', () {
    const coin = TWCoinType.ICON;

    test('Validation', () {
      expect(
          TWAnyAddress.isValid(
              'cx116f042497e5f34268b1b91e742680f84cf4e9f3', coin),
          true);
      expect(
          TWAnyAddress.isValid(
              'hx116f042497e5f34268b1b91e742680f84cf4e9f3', coin),
          true);

      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(TWAnyAddress.isValid('dshadghasdghsadadsadjsad', coin), false);
      expect(
          TWAnyAddress.isValid(
              '0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed', coin),
          false);
    });

    test('String', () {
      final address =
          TWAnyAddress('cx116f042497e5f34268b1b91e742680f84cf4e9f3', coin);
      expect(address.description, 'cx116f042497e5f34268b1b91e742680f84cf4e9f3');

      final address2 =
          TWAnyAddress('cx116f042497e5f34268b1b91e742680f84cf4e9f3', coin);
      expect(
          address2.description, 'cx116f042497e5f34268b1b91e742680f84cf4e9f3');

      expect(TWAnyAddress('', coin).pointer, 0);
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '94d1a980d5e528067d44bf8a60d646f556e40ca71e17cd4ead2d56f89e4bd20f');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, 'hx98c0832ca5bd8e8bf355ca9491888aa9725c2c48');
    });
  });
}

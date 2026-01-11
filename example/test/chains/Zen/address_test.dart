import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('ZenAddress', () {
    const coin = TWCoinType.Zen;

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('zshX5BAgUvNgM1VoBVKZyFVVozTDjjJvRxJ', coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5abs', coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '3a8e0a528f62f4ca2c77744c8a571def2845079b50105a9f7ef6b1b823def67a');
      final pubKey = privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(
        address.description,
        'znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg',
      );
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
          '02b4ac9056d20c52ac11b0d7e83715dd3eac851cfc9cb64b8546d9ea0d4bb3bdfe',
          TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(
        address.description,
        'znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg',
      );
    });

    test('FromString', () {
      var address = TWAnyAddress('znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg', coin);
      expect(address.description, 'znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg');

      address = TWAnyAddress('zshX5BAgUvNgM1VoBVKZyFVVozTDjjJvRxJ', coin);
      expect(address.description, 'zshX5BAgUvNgM1VoBVKZyFVVozTDjjJvRxJ');
    });
  });
}

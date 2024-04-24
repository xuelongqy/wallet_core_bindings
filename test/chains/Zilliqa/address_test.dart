import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('ZilliqaAddress', () {
    const coin = TWCoinType.TWCoinTypeZilliqa;

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '3382266517e2ebe6df51faf4bfe612236ad46fb8bd59ac982a223b045e080ac6');
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final expectedAddress = "zil1j8xae6lggm8y63m3y2r7aefu797ze7mhzulnqg";

      expect(address.description, expectedAddress);
    });

    test('Validation', () {
      expect(
        TWAnyAddress.isValid('0x91cddcebe846ce4d47712287eee53cf17c2cfb7', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('0x', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('91cddcebe846ce4d47712287eee53cf17c2cfb7', coin),
        false,
      );

      expect(
        TWAnyAddress.isValid(
            'zil1fwh4ltdguhde9s7nysnp33d5wye6uqpugufkz7', coin),
        true,
      );
    });
  });
}

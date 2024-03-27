import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('AptosAddress', () {
    const coin = TWCoinType.TWCoinTypeAptos;

    test('Valid', () {
      expect(TWAnyAddress.isValid('0x1', coin), true);
      expect(TWAnyAddress.isValid('0x0', coin), true);
      expect(
        TWAnyAddress.isValid(
            '0xeeff357ea5c1a4e7bc11b2b17ff2dc2dcca69750bfef1e1ebcaccf8c8018175b',
            coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'eeff357ea5c1a4e7bc11b2b17ff2dc2dcca69750bfef1e1ebcaccf8c8018175b',
            coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            '19aadeca9388e009d136245b9a67423f3eee242b03142849eb4f81a4a409e59c',
            coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            '0x777821c78442e17d82c3d7a371f42de7189e4248e529fe6eee6bca40ddbb',
            coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            '0xeeff357ea5c1a4e7bc11b2b17ff2dc2dcca69750bfef1e1ebcaccf8c8018175',
            coin),
        true,
      );
    });

    test('Invalid', () {
      expect(TWAnyAddress.isValid('', coin), false);
      expect(
        TWAnyAddress.isValid(
            'Seff357ea5c1a4e7bc11b2b17ff2dc2dcca69750bfef1e1ebcaccf8c8018175b',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'eeff357ea5c1a4e7bc11b2b17ff2dc2dcca69750bfef1e1ebcaccf8c8018175bb',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '0xSeff357ea5c1a4e7bc11b2b17ff2dc2dcca69750bfef1e1ebcaccf8c8018175b',
            coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '088baa019f081d6eab8dff5c447f9ce2f83c1babf3d03686299eaf6a1e89156e');
      final pubkey =
          privateKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519);
      final address = TWAnyAddress.createWithPublicKey(
        publicKey: pubkey,
        coin: coin,
      );
      expect(address.description,
          '0xe9c4d0b6fe32a5cc8ebd1e9ad5b54a0276a57f2d081dcb5e30342319963626c3');
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        'ad0e293a56c9fc648d1872a00521d97e6b65724519a2676c2c47cb95d131cf5a',
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(
        publicKey: publicKey,
        coin: coin,
      );
      expect(address.description,
          '0xe9c4d0b6fe32a5cc8ebd1e9ad5b54a0276a57f2d081dcb5e30342319963626c3');
    });
  });
}

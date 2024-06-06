import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('ZcashAddress', () {
    const coin = TWCoinType.Zcash;

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, 't1Wg9uPPAfwhBWeRjtDPa5ZHNzyBx9rJVKY');
    });

    test('FromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'BE88DF1D0BF30A923CB39C3BB953178BAAF3726E8D3CE81E7C8462E046E0D835');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, 't1gaySCXCYtXE3ygP38YuWtVZczsEbdjG49');
    });

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('t1RygJmrLdNGgi98gUgEJDTVaELTAYWoMBy', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('t1TWk2mmvESDnE4dmCfT7MQ97ij6ZqLpNVU', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('t3RD6RFKhWSotNbPEY4Vw7Ku9QCfKkzrbBL', coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('abc', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('175tWpb8K1S7NmH4Zx6rewF9WQrcZv245W', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('t1RygJmrLdNGgi98+UgEJDTVaELTAYWoMBy', coin),
        false,
      ); // Invalid Base58
      expect(
        TWAnyAddress.isValid('t1RygJmrLdNGgi98gUgEJDTVaELTAYW', coin),
        false,
      ); // too short
      expect(
        TWAnyAddress.isValid('t1RygJmrLdNGgi98gUgEJDTVaELTAYWoMBz', coin),
        false,
      ); // bad checksum
      expect(
        TWAnyAddress.isValid('TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC', coin),
        false,
      ); // too short
      expect(
        TWAnyAddress.isValid('2NRbuP5YfzRNEa1RibT5kXay1VgvQHnydZY1', coin),
        false,
      ); // invalid prefix
    });

    test('InitWithString', () {
      {
        final address =
            TWAnyAddress('t1Wg9uPPAfwhBWeRjtDPa5ZHNzyBx9rJVKY', coin);
        expect(address.description, 't1Wg9uPPAfwhBWeRjtDPa5ZHNzyBx9rJVKY');
      }

      {
        final address =
            TWAnyAddress('t3RD6RFKhWSotNbPEY4Vw7Ku9QCfKkzrbBL', coin);
        expect(address.description, 't3RD6RFKhWSotNbPEY4Vw7Ku9QCfKkzrbBL');
      }
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TronAddress', () {
    const coin = TWCoinType.Tron;

    test('FromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC');

      final privateKey2 = TWPrivateKey.createWithHexString(
          'BE88DF1D0BF30A923CB39C3BB953178BAAF3726E8D3CE81E7C8462E046E0D835');
      final publicKey2 =
          privateKey2.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);
      final address2 = TWAnyAddress.createWithPublicKey(publicKey2, coin);
      expect(address2.description, 'THRF3GuPnvvPzKoaT8pJex5XHmo8NNbCb3');
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
        TWAnyAddress.isValid('2MegQ6oqSda2tTagdEzBA', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC', coin),
        true,
      );
    });

    test('InitWithString', () {
      final address = TWAnyAddress('TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC', coin);

      expect(address.description, 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC');
    });
  });
}

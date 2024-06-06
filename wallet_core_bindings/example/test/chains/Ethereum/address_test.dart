import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('EthereumAddress', () {
    const coin = TWCoinType.Ethereum;

    test('Invalid', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(
        TWAnyAddress.isValid('aaeb60f3e94c9b9a09f33669435e7ef1beaed', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('fB6916095ca1df60bB79Ce92cE3Ea74c37c5d359', coin),
        false,
      );
    });

    test('String', () {
      expect(
        TWAnyAddress('0x5aaeb6053f3e94c9b9a09f33669435e7ef1beaed', coin)
            .description,
        '0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed',
      );
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, '0xAc1ec44E4f0ca7D172B7803f6836De87Fb72b309');

      final publicKey2 = privateKey.getPublicKeyByType(TWPublicKeyType.ED25519);
      final address2 = TWAnyAddress.createWithPublicKey(publicKey2, coin);
      expect(address2.description, '');
    });

    test('IsValid', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(
        TWAnyAddress.isValid(
            '0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed', coin),
        true,
      );
    });
  });
}

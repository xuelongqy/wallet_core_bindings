import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('PactusAddress', () {
    test('AddressData', () {
      const string = 'pc1rspm7ps49gar9ft5g0tkl6lhxs8ygeakq87quh3';
      final addr = TWAnyAddress(string, TWCoinType.Pactus);
      final string2 = addr.description;
      expect(string, string2);
      final keyHash = addr.data;
      expectHex(keyHash, '038077e0c2a5474654ae887aedfd7ee681c88cf6c0');
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '2134ae97465505dfd5a1fd05a8a0f146209c601eb3f1b0363b4cfe4b47ba1ab4');
      final pubkey = privateKey.getPublicKeyByType(TWPublicKeyType.ED25519);
      final address =
          TWAnyAddress.createWithPublicKey(pubkey, TWCoinType.Pactus)
              .description;
      expect(address, 'pc1r7jkvfnegf0rf5ua05fzu9krjhjxcrrygl3v4nl');
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '600d30a4373ae788e2d4a08f4728f45d259593fbdd9632bbe283c4c37ac6a3df',
        TWPublicKeyType.ED25519,
      );
      final address =
          TWAnyAddress.createWithPublicKey(publicKey, TWCoinType.Pactus)
              .description;
      expect(address, 'pc1r7jkvfnegf0rf5ua05fzu9krjhjxcrrygl3v4nl');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('NeblAddress', () {
    const coin = TWCoinType.Nebl;

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc', coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('TZzJsL7VSUVeTcLb12LHr5tUW9bcx1T4G3', coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      final privaKey = TWPrivateKey.createWithHexString(
          '4222aae79af41eade7b07ce6fd44d926ea8e3f95e51a06e85f8bdec89680cbd9');
      final publicKey = privaKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc');
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '03787a4c5ff72dce6d97f9b6360dc302b2d8a833e8c570dcc124a96e5f564bb524',
        TWPublicKeyType.SECP256k1,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc');

      final addr = coin.deriveAddressFromPublicKey(publicKey);
      expect(addr, 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc');
    });

    test('FromString', () {
      final address = TWAnyAddress('NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc', coin);
      expect(address.description, 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc');

      var data = address.data;
      expect(hex(data), 'ae40b2142aba5ddd10f74d9440bfda8a36cbad5b');
    });
  });
}

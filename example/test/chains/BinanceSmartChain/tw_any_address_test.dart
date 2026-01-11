import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBinanceSmartChain', () {
    const coin = TWCoinType.SmartChain;

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '727f677b390c151caf9c206fd77f77918f56904b5504243db9b21e51182c4c06');
      final publicKey = privateKey.getPublicKeySecp256k1(false);
      const string = '0xf3d468DBb386aaD46E92FF222adDdf872C8CC064';

      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final expected = TWAnyAddress(string, coin);

      final addressString = address.description;
      final expectedString = expected.description;

      expect(addressString, string);
      expect(expectedString, string);
    });
  });
}

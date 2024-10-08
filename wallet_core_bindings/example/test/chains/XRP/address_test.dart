import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('RippleAddress', () {
    const coin = TWCoinType.XRP;

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0303E20EC6B4A39A629815AE02C0A1393B9225E3B890CAE45B59F42FA29BE9668D',
        TWPublicKeyType.SECP256k1,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'rnBFvgZphmN39GWzUJeUitaP22Fr9be75H');
    });

    test('FromString', () {
      const classic = "rnBFvgZphmN39GWzUJeUitaP22Fr9be75H";
      final address = TWAnyAddress(classic, coin);
      expect(address.description, classic);
    });

    test('FromPublicKeyX', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0303E20EC6B4A39A629815AE02C0A1393B9225E3B890CAE45B59F42FA29BE9668D',
        TWPublicKeyType.SECP256k1,
      );
      final address = TWRippleXAddress.createWithPublicKey(publicKey, 12345);
      expect(address.description,
          'X76UnYEMbQfEs3mUqgtjp4zFy9exgThRj7XVZ6UxsdrBptF');
    });

    test('FromStringX', () {
      const xAddress = "X76UnYEMbQfEs3mUqgtjp4zFy9exgThRj7XVZ6UxsdrBptF";
      const xAddress2 = "X76UnYEMbQfEs3mUqgtjp4zFy9exgTsM93nriVZAPufrpE3";
      final address = TWRippleXAddress(xAddress);
      final address2 = TWRippleXAddress(xAddress2);

      expect(address.tag, 12345);
      expect(address.description, xAddress);

      expect(address2.tag, 0);
      expect(address2.description, xAddress2);
    });

    test('isValid', () {
      const classicAddress = "r36yxStAh7qgTQNHTzjZvXybCTzUFhrfav";
      const bitcoinAddress = "1Ma2DrB78K7jmAwaomqZNRMCvgQrNjE2QC";
      const xAddress = "XVfvixWZQKkcenFRYApCjpTUyJ4BePTe3jJv7beatUZvQYh";

      expect(TWAnyAddress.isValid(classicAddress, coin), true);
      expect(TWRippleXAddress.isValidString(xAddress), true);
      expect(TWAnyAddress.isValid(bitcoinAddress, coin), false);
      expect(TWRippleXAddress.isValidString(bitcoinAddress), false);
    });
  });
}

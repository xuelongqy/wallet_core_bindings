import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  const validAddrStr1 = "X76UnYEMbQfEs3mUqgtjp4zFy9exgThRj7XVZ6UxsdrBptF";
  const publicKeyDataStr1 =
      "0303E20EC6B4A39A629815AE02C0A1393B9225E3B890CAE45B59F42FA29BE9668D";
  const invalidAddrStr1 = "12345678";

  group('TWRippleXAddress', () {
    const coin = TWCoinType.XRP;

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );

      final xpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPUB,
      );
      final xprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPRV,
      );

      expect(xpub,
          'xpub6D9oDY4gqFBtsFEonh5GTDiUm6nmij373YWzmYdshcnM4AFzdhUf55iZD33vNU2ZqfQJU5wiCJUgisMt2RHKDzhi1PbZfh5Y2NiiYJAQqUn');
      expect(xprv,
          'xprv9zASp2XnzsdbemALgfYG65mkD4xHKGKFgKbPyAEG9HFNBMvr6AAQXHQ5MmqM66EnbJfe9TvYMy1bucz7hSQjG43NVizRZwJJYfLmeKo4nVB');
    });

    test('XAddress', () {
      const string = 'XVfvixWZQKkcenFRYApCjpTUyJ4BePTe3jJv7beatUZvQYh';
      final xAddress = TWRippleXAddress(string);

      expect(TWRippleXAddress.isValidString(string), true);
      expect(xAddress.tag, 12345);
      expect(xAddress.description,
          'XVfvixWZQKkcenFRYApCjpTUyJ4BePTe3jJv7beatUZvQYh');
    });

    test('CreateAndDelete', () {
      {
        final addr = TWRippleXAddress(validAddrStr1);
        expect(addr.pointer != 0, true);
      }
      {
        final publicKey = TWPublicKey.createWithHexString(
          publicKeyDataStr1,
          TWPublicKeyType.SECP256k1,
        );
        final addr = TWRippleXAddress.createWithPublicKey(publicKey, 12345);
        expect(addr.pointer != 0, true);
      }
    });

    test('AddressEqual', () {
      final publicKey = TWPublicKey.createWithHexString(
        publicKeyDataStr1,
        TWPublicKeyType.SECP256k1,
      );
      final addr1 = TWRippleXAddress.createWithPublicKey(publicKey, 12345);
      expect(addr1.pointer != 0, true);

      final addr2 = TWRippleXAddress(validAddrStr1);
      expect(addr2.pointer != 0, true);
      expect(addr1, addr2);
    });

    test('IsValidString', () {
      expect(TWRippleXAddress.isValidString(validAddrStr1), true);
      expect(TWRippleXAddress.isValidString(invalidAddrStr1), false);
    });

    test('AddressDescription', () {
      final addr1 = TWRippleXAddress(validAddrStr1);
      expect(addr1.pointer != 0, true);
      final addrStr1 = addr1.description;
      expect(addrStr1, validAddrStr1);
    });
  });
}

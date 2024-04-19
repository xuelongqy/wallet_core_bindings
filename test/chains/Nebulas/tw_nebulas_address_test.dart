import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('Nebulas', () {
    const coin = TWCoinType.TWCoinTypeNebulas;

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'd2fd0ec9f6268fc8d1f563e3e976436936708bdf0dc60c66f35890f5967a8d2b');
      final publicKey = privateKey.getPublicKeySecp256k1(false);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressString = address.description;
      expect(addressString, 'n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY');
    });

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );

      final xpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: coin,
        version: TWHDVersion.TWHDVersionXPUB,
      );
      final xprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: coin,
        version: TWHDVersion.TWHDVersionXPRV,
      );

      // generate by https://iancoleman.io/bip39/#english
      expect(xpub,
          'xpub6BfZdeDKShWRToXqkSHsN3DN39LG59WgR4SWQoJRGLejQbfjGpsqNLgTNKkda47ykF3kpZ7ktEKPJfBR65QqBzrRfdEKPbhxQ7kxXaFWARU');
      expect(xprv,
          'xprv9xgDE8gRcKx8FKTNeQkrzuGdV7Vmfgnq3qWucQtoi17kXoLajHZapYMyX5Gg1qQ3isvekWzUJ7oTaD6U9hCYjz7mVYpRohvsgmwH8SRV7t2');
    });

    test('AddressEqual', () {
      final address1 =
          TWAnyAddress('n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY', coin);
      final address2 =
          TWAnyAddress('n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY', coin);
      final address3 =
          TWAnyAddress('n1zUNqeBPvsyrw5zxp9mKcDdLTjuaEL7s39', coin);
      expect(address1, address2);
      expect(address1 != address3, true);
    });

    test('AddressIsValidString', () {
      expect(
        TWAnyAddress.isValid('n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('n1zUNqeBPvsyrw5zxp9mKcDdLTjuaEL7s39', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('a1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('n2V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('n123', coin),
        false,
      );
    });
  });
}

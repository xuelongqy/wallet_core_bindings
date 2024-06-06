import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZcash', () {
    const coin = TWCoinType.Zcash;

    test('TransparentAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '987919d988ef94e678bce254c932e7a7a76744b2c008467448406d4246513132');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, 't1RygJmrLdNGgi98gUgEJDTVaELTAYWoMBy');
    });

    test('DeriveTransparentAddress', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );
      const derivationPath = "m/44'/133'/0'/0/5";
      final key = wallet.getKey(coin, derivationPath);
      final publicKey = key.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, 't1TWk2mmvESDnE4dmCfT7MQ97ij6ZqLpNVU');
    });

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
          'xpub6CksSgKBhD9KaLgxLE9LXpSj74b2EB9d1yKvhWxrstk4Md8gmiJb5GwkMeBhpLxVjACMdNbRsAm2GG5ehVuyq42QBYYPAjXjcBxMVmpaaNL');
      expect(xprv,
          'xprv9ymX3AnHrqb2MrcVECcLAgVzZ2kXpiRmekQKu8ZFKZD5UpoYEAzLXUdGWPZJn1mwWn8pEmqKh97KwdE2r3PCQAnoWAPEThMCLEKSPK3NgRS');
    });

    test('DerivePubkeyFromXpub', () {
      const xpub =
          'xpub6CksSgKBhD9KaLgxLE9LXpSj74b2EB9d1yKvhWxrstk4Md8gmiJb5GwkMeBhpLxVjACMdNbRsAm2GG5ehVuyq42QBYYPAjXjcBxMVmpaaNL';
      final pubkey3 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/133'/0'/0/3");
      final pubKey5 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/133'/0'/0/5");

      final address3 = TWAnyAddress.createWithPublicKey(pubkey3, coin);
      final address3String = address3.description;

      final address5 = TWAnyAddress.createWithPublicKey(pubKey5, coin);
      final address5String = address5.description;

      expect(address3String, 't1cWhcXydPYTG1pgHMsZ6JEPsWGxVMdJ5t6');
      expect(address5String, 't1TWk2mmvESDnE4dmCfT7MQ97ij6ZqLpNVU');
    });

    test('DerivePubkeyFromXpub2', () {
      const xpub =
          'xpub6C7HhMqpir3KBA6ammv5B58RT3XFTJqoZFoj3J56dz9XwehZ2puSH38ERtnz7HaXGxaZP8AHT4M2bSRHpBXUZrbsJ2xg3xs53DGKYCqj8mr';
      final pubkey = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/133'/0'/0/0");
      final address = coin.deriveAddressFromPublicKey(pubkey);
      expect(address, 't1TKCtCETHPrAdA6eY1fdhhnTkTmb371oPt');
    });

    test('LockScripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          't1bjVPEY8NbpGxT2PgayX3HevfJ2YU5X2DS', coin);
      final scriptData = script.data;
      expect(hex(scriptData),
          '76a914c3e968851fdb2bb943662befdb8b8573ecd4d08e88ac');

      final script2 = TWBitcoinScript.lockScriptForAddress(
          't3gQDEavk5VzAAHK8TrQu2BWDLxEiF1unBm', coin);
      final scriptData2 = script2.data;
      expect(
          hex(scriptData2), 'a914ef8b3e86db855eb48bcf0b7585a90b6b9ece75c087');
    });
  });
}

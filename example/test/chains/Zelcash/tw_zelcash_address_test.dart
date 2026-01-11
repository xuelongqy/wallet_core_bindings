import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZelcash', () {
    const coin = TWCoinType.Zelcash;

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
      const derivationPath = "m/44'/19167'/0'/0/5";
      final key = wallet.getKey(coin, derivationPath);
      final publicKey = key.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, 't1Trs2rNPzL4Jm24foTd89KpPWqLtLSciDY');
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
          'xpub6DATuScKPEk6YvULrHPff1NKC49nyz5mCZQyxSDEQihq3kfoKDYCznLrsdW4KmXw9TryNfEZ9JSD8tJL9UTC3LnBA54YZL7nqMtJm7Ffnoz');
      expect(xprv,
          'xprv9zB7Vw5RYsBoLSPskFrfHsRae2KJaXMuqLVPA3ocrPArAxLemgDxSz2P2NdreeXKs8N3BxbVPHXeiaamtWC4zoa2Ff8toqa7NEbNWH32Ctb');
    });

    test('DerivePubkeyFromXpub', () {
      const xpub =
          'xpub6DATuScKPEk6YvULrHPff1NKC49nyz5mCZQyxSDEQihq3kfoKDYCznLrsdW4KmXw9TryNfEZ9JSD8tJL9UTC3LnBA54YZL7nqMtJm7Ffnoz';
      final pubkey3 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/19167'/0'/0/3");
      final pubKey5 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/19167'/0'/0/5");

      final address3 = TWAnyAddress.createWithPublicKey(pubkey3, coin);
      final address3String = address3.description;

      final address5 = TWAnyAddress.createWithPublicKey(pubKey5, coin);
      final address5String = address5.description;

      expect(address3String, 't1NdSKKkBXV3GBDMcPvpWu12qcNwAZwB4hD');
      expect(address5String, 't1Trs2rNPzL4Jm24foTd89KpPWqLtLSciDY');
    });

    test('DerivePubkeyFromXpub2', () {
      const xpub =
          'xpub6C7HhMqpir3KBA6ammv5B58RT3XFTJqoZFoj3J56dz9XwehZ2puSH38ERtnz7HaXGxaZP8AHT4M2bSRHpBXUZrbsJ2xg3xs53DGKYCqj8mr';
      final pubkey = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/19167'/0'/0/0");
      final address = coin.deriveAddressFromPublicKey(pubkey);
      expect(address, 't1TKCtCETHPrAdA6eY1fdhhnTkTmb371oPt');
    });
  });
}

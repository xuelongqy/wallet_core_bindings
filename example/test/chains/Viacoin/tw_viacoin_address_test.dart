import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('Viacoin', () {
    const coin = TWCoinType.Viacoin;

    test('LegacyAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a22ddec5c567b4488bb00f69b6146c50da2ee883e2c096db098726394d585730');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address =
          TWBitcoinAddress.createWithPublicKey(publicKey, coin.p2pkhPrefix);
      final addressString = address.description;
      expect(addressString, 'VjtD8cQgvesPYWxfWoHjwz1BuLCHwDn7PA');
    });

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '55f9cbb0376c422946fa28397c1219933ac60b312ede41bfacaf701ecd546625');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address =
          TWSegwitAddress.createWithPublicKey(TWHRP.Viacoin, publicKey);
      final string = address.description;
      expect(string, 'via1qytnqzjknvv03jwfgrsmzt0ycmwqgl0asu2r3d2');
    });

    test('LockScriptForAddressV', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'Vw6bJFaF5Hyiveko7dpqRjVvcTAsjz7eYa', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a914e771c6695c5dd189ccc4ef00cd0f3db3096d79bd88ac');
    });

    test('LockScriptForAddressE', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'ESxRxvhJP6ZKtYaMGjj48As1kgCh6hXa6X', coin);
      final scriptData = script.data;
      expectHex(scriptData, 'a9146b85b3dac9340f36b9d32bbacf2ffcb0851ef17987');
    });

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );

      // .bip44
      final xpub = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPUB,
      );
      final xprv = wallet.getExtendedPublicKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPRV,
      );

      expect(xprv,
          'xprv9yfeb9VRNAACDabSE2tEWVXPLJ2R8zAvWDies2gQjaB8LgM1WYYFCM2evs7TNQxY2EZbnDoLKKNm4KzjAhYNTBovPtQGTSojmT3NrRLPXwy');
      expect(xpub,
          'xpub6Cezzf2KCXiVS4fuL4REsdU7tKruYStmsSeFfR62Hui7DUgA45rVk9M8mwvvq9EK1k9riyaHgFUELk2GNpsubV2GxqsbDaiPQ1pxmWAgbLV');

      // .bip49
      final yprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.BIP49,
        coin: coin,
        version: TWHDVersion.YPRV,
      );
      final ypub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.BIP49,
        coin: coin,
        version: TWHDVersion.YPUB,
      );

      expect(yprv,
          'yprvAKLdkDwhRv7XF5WTrvBfUJ24Fw9k1ucaAwapzJ9qf2wJJqThVpiQNbfUNy7ptmyBfPGy3BauBWHqoA33cox7decvLedUVe7d1GTHNe2u6pY');
      expect(ypub,
          'ypub6YKz9jUbGHfpTZavxwifqRxnoxzERNLRYAWRngZTDNUHBdnr3N2evPyxEDVzsHBv8ZCtwZ7Fdx9ge9zk4nheQiDVtEApy71r2m3sLkrjeVK');

      // .bip84
      final zprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.BIP84,
        coin: coin,
        version: TWHDVersion.ZPRV,
      );
      final zpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.BIP84,
        coin: coin,
        version: TWHDVersion.ZPUB,
      );

      expect(zprv,
          'zprvAcV8GDQ8b8UQpxtftFxgEbrftqsa5HxLjriVeMQEbvQFcKD7hsV5gY7DyLaGi448CNBKxZFspSKtiHNwd2VtqeUidEdD87SLumsmkDDvogA');
      expect(zpub,
          'zpub6qUUfiw2RW2i3Sy8zHVgbjoQSsi4UkgC75e6SjorAFwEV7YGFQoLELRhpe8NZ3xtsKHhbJW3kYWQLMFfCmMFDPkSer8BP9fiJcaZRL4LsR4');
    });

    test('DeriveFromZpub', () {
      const zpub =
          'zpub6sCFp8chadVDXVt7GRmQFpq8B7W8wMLdFDto1hXu2jLZtvkFhRnwScXARNfrGSeyhR8DBLJnaUUkBbkmB2GwUYkecEAMUcbUpFQV4v7PXcs';
      final pubKey4 = TWHDWallet.getPublicKeyFromExtended(
        extended: zpub,
        coin: coin,
        derivationPath: "m/44'/14'/0'/0/4",
      );
      final pubKey11 = TWHDWallet.getPublicKeyFromExtended(
        extended: zpub,
        coin: coin,
        derivationPath: "m/44'/14'/0'/0/11",
      );

      final address4 = TWAnyAddress.createWithPublicKey(pubKey4, coin);
      final address4String = address4.description;

      final address11 = TWAnyAddress.createWithPublicKey(pubKey11, coin);
      final address11String = address11.description;

      expect(address4String, 'via1qcgnevr9rp7aazy62m4gen0tfzlssa52agh6ugv');
      expect(address11String, 'via1qy072y8968nzp6mz3j292h8lp72d678fc4zwd0f');
    });

    test('LockScripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'via1qs32zgdhe2tpzcnz55r7d9jvhce33063s8w4xre', coin);
      final scriptData = script.data;
      expectHex(scriptData, '001484542436f952c22c4c54a0fcd2c997c66317ea30');

      final script2 = TWBitcoinScript.lockScriptForAddress(
          'ESxRxvhJP6ZKtYaMGjj48As1kgCh6hXa6X', coin);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a9146b85b3dac9340f36b9d32bbacf2ffcb0851ef17987');

      final script3 = TWBitcoinScript.lockScriptForAddress(
          'Vw6bJFaF5Hyiveko7dpqRjVvcTAsjz7eYa', coin);
      final scriptData3 = script3.data;
      expectHex(
          scriptData3, '76a914e771c6695c5dd189ccc4ef00cd0f3db3096d79bd88ac');
    });
  });
}

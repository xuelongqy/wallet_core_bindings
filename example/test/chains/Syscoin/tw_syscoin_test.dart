import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('Syscoin', () {
    const coin = TWCoinType.Syscoin;

    test('LegacyAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a22ddec5c567b4488bb00f69b6146c50da2ee883e2c096db098726394d585730');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address =
          TWBitcoinAddress.createWithPublicKey(publicKey, coin.p2pkhPrefix);
      final addressString = address.description;
      expect(addressString, 'SXBPFk2PFDAP13qyKSdC4yptsJ8kJRAT3T');
    });

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '55f9cbb0376c422946fa28397c1219933ac60b312ede41bfacaf701ecd546625');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressString = address.description;
      expect(addressString, 'sys1qytnqzjknvv03jwfgrsmzt0ycmwqgl0as7lkcf7');
    });

    test('LockScriptForLegacyAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'SXBPFk2PFDAP13qyKSdC4yptsJ8kJRAT3T', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a9146c70e57df7b18eeb0198be9e254737ecd336ed8888ac');
    });

    test('LockScriptForAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'sys1qytnqzjknvv03jwfgrsmzt0ycmwqgl0as7lkcf7', coin);
      final scriptData = script.data;
      expectHex(scriptData, '001422e6014ad3631f1939281c3625bc98db808fbfb0');
    });

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );

      // .bip44
      final xprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPRV,
      );
      final xpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPUB,
      );

      expect(xprv,
          'xprv9yFNgN7z81uG6QtwFt7gvbmLeDGeGfS2ar3DunwEkZcC7uLBXyy4eaaV3ir769zMLe3eHuTaGUtWVXwp6dkunLsfmA7bf3XqEFpTjHxSijx');
      expect(xpub,
          'xpub6CEj5sesxPTZJtyQMuehHji5CF78g89sx4xpiBLrJu9AzhfL5XHKCNtxtzPzyGxqb6jMbZfmbHeSGZZArL4hLttmdC6KEMuiWy7VocTYjzR');

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
          'yprvAJAofBFEEQ1DLJJVMkPr4pufHLUKZ2VSbtHqPpphEgwgfvG8exgadM8vtW8AW52N7tqU4qM8JHk5xZkq3icnzoph5QA5kRVHBnhXuRMGw2b');
      expect(ypub,
          'ypub6XAA4gn84mZWYnNxTmvrRxrPqNJoxVDHy7DSCDEJo2UfYibHCVzqB9TQjmL2TKSEZVFmTNcmdJXunEu6oV2AFQNeiszjzcnX4nbG27s4SgS');

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
          'zprvAcdCiLx9ooAFnC1hXh7stnobLnnu7u25rqfLeJ9v632xdCXJrc8KvgNk2eZeQQbPQHvcUpsfJzgyDkRdfnkT6vjpYqkxFv1LsPxQ7uFwLGy');
      expect(zpub,
          'zpub6qcZ7rV3eAiYzg6AdietFvkKtpdPXMjwE4awSgZXeNZwVzrTQ9SaUUhDswmdA4A5riyimx322es7niQvJ1Fbi3mJNSVz3d3f9GBsYBb8Wky');
    });

    test('DeriveFromXpub', () {
      const xpub =
          'zpub6sCFp8chadVDXVt7GRmQFpq8B7W8wMLdFDto1hXu2jLZtvkFhRnwScXARNfrGSeyhR8DBLJnaUUkBbkmB2GwUYkecEAMUcbUpFQV4v7PXcs';
      final pubKey4 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/2'/0'/0/4");
      final pubKey11 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/2'/0'/0/11");

      final address4 = TWAnyAddress.createWithPublicKey(pubKey4, coin);
      final address4String = address4.description;

      final address11 = TWAnyAddress.createWithPublicKey(pubKey11, coin);
      final address11String = address11.description;

      expect(address4String, 'sys1qcgnevr9rp7aazy62m4gen0tfzlssa52a2z04vc');
      expect(address11String, 'sys1qy072y8968nzp6mz3j292h8lp72d678fchhmyta');
    });
  });
}

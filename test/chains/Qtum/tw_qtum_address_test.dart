import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('Qtum', () {
    const coin = TWCoinType.TWCoinTypeQtum;

    test('LegacyAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a22ddec5c567b4488bb00f69b6146c50da2ee883e2c096db098726394d585730');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWBitcoinAddress.createWithPublicKey(
          publicKey, TWCoinTypeP2pkhPrefix(coin));
      final addressString = address.description;
      expect(addressString, 'QWVNLCXwhJqzut9YCLxbeMTximr2hmw7Vr');
    });

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '55f9cbb0376c422946fa28397c1219933ac60b312ede41bfacaf701ecd546625');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address =
          TWSegwitAddress.createWithPublicKey(TWHRP.TWHRPQtum, publicKey);
      final addressString = address.description;
      expect(addressString, 'qc1qytnqzjknvv03jwfgrsmzt0ycmwqgl0as6uywkk');
    });

    test('LockScripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'MHhghmmCTASDnuwpgsPUNJVPTFaj61GzaG', coin);
      final scriptData = script.data;
      expect(hex(scriptData), 'a9146b85b3dac9340f36b9d32bbacf2ffcb0851ef17987');

      final script3 = TWBitcoinScript.lockScriptForAddress(
          'qc1qxssrzt03ncm0uda02vd8tuvrk0eg9wrz8qm2qe', coin);
      final scriptData3 = script3.data;
      expect(hex(scriptData3), '00143420312df19e36fe37af531a75f183b3f282b862');
    });

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );

      // .bip44
      final xprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: coin,
        version: TWHDVersion.TWHDVersionXPRV,
      );
      final xpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: coin,
        version: TWHDVersion.TWHDVersionXPUB,
      );

      expect(
        xprv,
        'xprv9yBPu3rkmyffD3A4TngwcpffYASEEfYnShyhuUsL3h9GiYdUjJh9S2s3vcYMoKi8L2cDqQcsFU5TkC1zgusTENCjatpnxp72X4uYkrej2tj',
      );
      expect(
        xpub,
        'xpub6CAkJZPecMDxRXEXZpDwyxcQ6CGie8GdovuJhsGwc2gFbLxdGr1PyqBXmsL7aYds1wfY2rB3YMVZiEE3CB3Lkj6KGoq1rEJ1wuaGkMDBf1m',
      );

      // .bip49
      final yprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP49,
        coin: coin,
        version: TWHDVersion.TWHDVersionYPRV,
      );
      final ypub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP49,
        coin: coin,
        version: TWHDVersion.TWHDVersionYPUB,
      );

      expect(
        yprv,
        'yprvAJdTrS1VXxDTRFGxPLJmjSECVCwqePCeCH7i6pLP3SiDg6G5omNiwEt88ENDy9nWMPmErGT5c1nGBsZRUjaTunFqw1w6xhWsAsLG6x8fR7d',
      );
      expect(
        ypub,
        'ypub6XcpFwYPNKmkdjMRVMqn6aAw3EnL3qvVZW3JuCjzbnFCYtbEMJgyV3CbyY8jVCtSBfSB5H12uLcFYUSEtsBYNaf46Zv2smueAZKGmDgT8k8',
      );

      // .bip84
      final zprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP84,
        coin: coin,
        version: TWHDVersion.TWHDVersionZPRV,
      );
      final zpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP84,
        coin: coin,
        version: TWHDVersion.TWHDVersionZPUB,
      );

      expect(
        zprv,
        'zprvAdJxRo2izCdp1NZQShHqyXXwNrkAbYqi9YwAkG6kCJ2V5JZY7s2TdmbF2YxTzQKVx3SWQiHpVpsKyZ59Y8Th7edf2hJBWuyTvnCadLMLxAz',
      );
      expect(
        zpub,
        'zpub6rJJqJZcpaC7DrdsYiprLfUfvtaf11ZZWmrmYeWMkdZTx6tgfQLiBZuisraogskwBRLMGWfXoCyWRrXSypwPdNV2UWJXm5bDVQvBXvrzz9d',
      );
    });

    test('DeriveFromXpub', () {
      final xpub =
          "xpub6CAkJZPecMDxRXEXZpDwyxcQ6CGie8GdovuJhsGwc2gFbLxdGr1PyqBXmsL7aYds1wfY2rB3YMVZiEE3CB3Lkj6KGoq1rEJ1wuaGkMDBf1m";
      final pubKey2 = TWHDWallet.getPublicKeyFromExtended(
        extended: xpub,
        coin: coin,
        derivationPath: "m/44'/2301'/0'/0/2",
      );
      final pubKey9 = TWHDWallet.getPublicKeyFromExtended(
        extended: xpub,
        coin: coin,
        derivationPath: "m/44'/2301'/0'/0/9",
      );

      final address2 = TWBitcoinAddress.createWithPublicKey(
          pubKey2, TWCoinTypeP2pkhPrefix(coin));
      final address2String = address2.description;

      final address9 = TWBitcoinAddress.createWithPublicKey(
          pubKey9, TWCoinTypeP2pkhPrefix(coin));
      final address9String = address9.description;

      expect(address2String, 'QStYeAAfiYKxsABzY9yugHDpm5bsynYPqc');
      expect(address9String, 'QfbKFChfhx1s4VXS9BzaVJgyKw5a1hnFg4');
    });

    test('DeriveFromZpub', () {
      final zpub =
          "zpub6rJJqJZcpaC7DrdsYiprLfUfvtaf11ZZWmrmYeWMkdZTx6tgfQLiBZuisraogskwBRLMGWfXoCyWRrXSypwPdNV2UWJXm5bDVQvBXvrzz9d";
      final pubKey4 = TWHDWallet.getPublicKeyFromExtended(
        extended: zpub,
        coin: coin,
        derivationPath: "m/44'/2301'/0'/0/4",
      );
      final pubKey11 = TWHDWallet.getPublicKeyFromExtended(
        extended: zpub,
        coin: coin,
        derivationPath: "m/44'/2301'/0'/0/11",
      );

      final address4 =
          TWSegwitAddress.createWithPublicKey(TWHRP.TWHRPQtum, pubKey4);
      final address4String = address4.description;

      final address11 =
          TWSegwitAddress.createWithPublicKey(TWHRP.TWHRPQtum, pubKey11);
      final address11String = address11.description;

      expect(address4String, 'qc1q3cvjmc2cgjkz9y58waj3r9ccchmrmrdzq03783');
      expect(address11String, 'qc1qrlk0ajg6khu2unsdppggs3pgpxxvdeymky58af');
    });

    /*
    HD scheme that is used in qtum desktop wallet is "<MASTER KEY>/<COIN>/<INTERNAL>":
    m/88'/0'
    m/88'/1'
    The trust wallet use different approach "<MASTER KEY>/<PURPOSE>/<COIN>":
    m/44'/2301'
    m/49'/2301'
    m/84'/2301'
    The master key is used to derive the other keys, so the wallet should work but will not be compatible with qtum desktop wallet.
    The rules for creating send/receive Qtum transactions are the same as Bitcoin.
    The default addresses in Qtum are the legacy addresses.
    */
  });
}

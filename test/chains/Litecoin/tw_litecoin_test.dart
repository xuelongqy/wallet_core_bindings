import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('Litecoin', () {
    const coin = TWCoinType.TWCoinTypeLitecoin;

    test('LegacyAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a22ddec5c567b4488bb00f69b6146c50da2ee883e2c096db098726394d585730');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWBitcoinAddress.createWithPublicKey(
          publicKey, TWCoinTypeP2pkhPrefix(coin));
      final addressString = address.description;
      expect(addressString, 'LV7LV7Z4bWDEjYkfx9dQo6k6RjGbXsg6hS');
    });

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '55f9cbb0376c422946fa28397c1219933ac60b312ede41bfacaf701ecd546625');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final string = address.description;

      expect(string, 'ltc1qytnqzjknvv03jwfgrsmzt0ycmwqgl0asjnaxwu');
    });

    test('LockScriptForAddressL', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'LgKiekick9Ka7gYoYzAWGrEq8rFBJzYiyf', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a914e771c6695c5dd189ccc4ef00cd0f3db3096d79bd88ac');
    });

    test('LockScriptForAddressM', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'MHhghmmCTASDnuwpgsPUNJVPTFaj61GzaG', coin);
      final scriptData = script.data;
      expectHex(scriptData, 'a9146b85b3dac9340f36b9d32bbacf2ffcb0851ef17987');
    });

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );

      // .bip44
      final lptv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: coin,
        version: TWHDVersion.TWHDVersionLTPV,
      );
      final ltub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: coin,
        version: TWHDVersion.TWHDVersionLTUB,
      );

      expect(lptv,
          'Ltpv77Tkf73NsKY3NQWVr6sHXeDQHWV6EVBXStcyxfnwEVebFuz1URxi16SBzj4v7n3mSYh8PQXhSFM2aXNFdx8bvWBLZGXeik3UQXeXn5vudGj');
      expect(ltub,
          'Ltub2Ye6FtTv7U4zzHDL6iMfcE3cj5BHJjkBXQj1deZEAgSBrHB5oM191hYTF8BC34r7vRDGng59yfP6FH4m3nttc3TLDg944G8QK7d5NnygCRu');

      // .bip49
      final mptv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP49,
        coin: coin,
        version: TWHDVersion.TWHDVersionMTPV,
      );
      final mtub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP49,
        coin: coin,
        version: TWHDVersion.TWHDVersionMTUB,
      );

      expect(mptv,
          'Mtpv7SPQ3PnRFU5yMidTBbXKxb6pgrE1Ny1yVssVvTz8VLDppPrhdydSaoMp6fm58VbtBTrVZVacMrSUim44RccBLu8NFAqj7ZaB5JBzb8cgQHp');
      expect(mtub,
          'Mtub2sZjeBCxVccvybLHSD1i3Aw38QvCTDadaPyXbSkRRX1RQm3mxtfsbQU5M3PdCSP4xAFHCceEQ3FmQF69Du2wbcmebt3CaWAGALBSe8c4Gvw');

      // .bip84
      final zptv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP84,
        coin: coin,
        version: TWHDVersion.TWHDVersionZPRV,
      );
      final zpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP84,
        coin: coin,
        version: TWHDVersion.TWHDVersionZPUB,
      );

      expect(zptv,
          'zprvAeCuQd5okFvvK1oeAQEPtgtPd5feXtcmszyCDK8HUPob28R79tUgtpCga79KgtDkUBn72AMig5NNzUCFY1JeRsZcEitDVEYuB48uHt2YEDB');
      expect(zpub,
          'zpub6sCFp8chadVDXVt7GRmQFpq8B7W8wMLdFDto1hXu2jLZtvkFhRnwScXARNfrGSeyhR8DBLJnaUUkBbkmB2GwUYkecEAMUcbUpFQV4v7PXcs');
    });

    test('DeriveFromZpub', () {
      final zpub =
          'zpub6sCFp8chadVDXVt7GRmQFpq8B7W8wMLdFDto1hXu2jLZtvkFhRnwScXARNfrGSeyhR8DBLJnaUUkBbkmB2GwUYkecEAMUcbUpFQV4v7PXcs';
      final pubKey4 =
          TWHDWallet.getPublicKeyFromExtended(zpub, coin, "m/44'/2'/0'/0/4");
      final pubKey11 =
          TWHDWallet.getPublicKeyFromExtended(zpub, coin, "m/44'/2'/0'/0/11");

      final address4 = TWAnyAddress.createWithPublicKey(pubKey4, coin);
      final address4String = address4.description;

      final address11 = TWAnyAddress.createWithPublicKey(pubKey11, coin);
      final address11String = address11.description;

      expect(address4String, 'ltc1qcgnevr9rp7aazy62m4gen0tfzlssa52axwytt6');
      expect(address11String, 'ltc1qy072y8968nzp6mz3j292h8lp72d678fcmms6vl');
    });

    test('LockScripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'ltc1qs32zgdhe2tpzcnz55r7d9jvhce33063sfht3q0', coin);
      final scriptData = script.data;
      expectHex(scriptData, '001484542436f952c22c4c54a0fcd2c997c66317ea30');

      final script2 = TWBitcoinScript.lockScriptForAddress(
          'MHhghmmCTASDnuwpgsPUNJVPTFaj61GzaG', coin);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a9146b85b3dac9340f36b9d32bbacf2ffcb0851ef17987');

      final script3 = TWBitcoinScript.lockScriptForAddress(
          'LgKiekick9Ka7gYoYzAWGrEq8rFBJzYiyf', coin);
      final scriptData3 = script3.data;
      expectHex(
          scriptData3, '76a914e771c6695c5dd189ccc4ef00cd0f3db3096d79bd88ac');
    });
  });
}

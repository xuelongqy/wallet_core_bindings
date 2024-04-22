import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('Monacoin', () {
    const coin = TWCoinType.TWCoinTypeMonacoin;

    test('LegacyAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a22ddec5c567b4488bb00f69b6146c50da2ee883e2c096db098726394d585730');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWBitcoinAddress.createWithPublicKey(
          publicKey, TWCoinTypeP2pkhPrefix(coin));
      final addressString = address.description;
      expect(addressString, 'MHnYTL9e1s8zNR2qzzJ3mMHfgjnUzyMscd');
    });

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '55f9cbb0376c422946fa28397c1219933ac60b312ede41bfacaf701ecd546625');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address =
          TWSegwitAddress.createWithPublicKey(TWHRP.TWHRPMonacoin, publicKey);
      final string = address.description;
      expect(string, 'mona1qytnqzjknvv03jwfgrsmzt0ycmwqgl0asju3qmd');
    });

    test('BuildForP2PKHAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'MFMy9FwJsV6HiN5eZDqDETw4pw52q3UGrb', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a91451dadacc7021440cbe4ca148a5db563b329b4c0388ac');
    });

    test('BuildForP2SHAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'PHjTKtgYLTJ9D2Bzw2f6xBB41KBm2HeGfg', coin);
      final scriptData = script.data;
      expectHex(scriptData, 'a9146449f568c9cd2378138f2636e1567112a184a9e887');
    });

    test('BuildForBech32Address', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'mona1q4kpn6psthgd5ur894auhjj2g02wlgmp8ke08ne', coin);
      final scriptData = script.data;
      expectHex(scriptData, '0014ad833d060bba1b4e0ce5af797949487a9df46c27');
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

      expect(xprv,
          'xprv9ySV9MzJnFMm7bi5qVTcqva3oDJojNsMYuASBcj9yC4QRe4kehWYeGfUVYFiJQipELCHmiutHJVxosR7eSovWHrWCUTdhf49D1N7MGKVcUZ');
      expect(xpub,
          'xpub6CRqYsXCccv4L5nYwWzdD4WnMF9J8qbCv862z18mXXbPJSPuCEpoC4yxLn5N81V5GWNuBsJ8g6tYsBb1V9hCipGn4WR6bc9FLUtyyRvDFse');

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

      expect(yprv,
          'yprvAJL1swHSWeFvfKdupcrsAvTCrtAiKUhLrUjteTj8JGCzD53YrJgiVbsChMPi5h119cn5tVVk1QAFSJtcnMSSxjGCNDXg8YaWbe4Hhc5bUfL');
      expect(ypub,
          'ypub6XKNHSpLM1pDsoiNvePsY4PwQv1CiwRCDhfVSr8jrbjy5sNhPqzy3QBgYdCayJhq5st63XZTWrea8So84QYbPgP2EvVR5dhSrW18ud4GZaT');

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
          'zprvAdi4KQxm5ofVJqh1Y5KxSTuC1CSEibkz3Ei4dnNMzyLt6FiW3rMPTgKUCiwv1cw4rVeDW9ju82ChFz27UNG2kxvtFsngJCYtHjDYURsefzX');
      expect(zpub,
          'zpub6rhQivVevBDnXKmUe6rxobqvZEGj84UqQTdfSAmyZJsry43ebPfe1Udx3zUNDB3cHu2ozNCDhsy8BuNCjCvStNmodzdR2E2wWAsLyNFu5i1');
    });

    test('DeriveFromZpub', () {
      final xpub =
          'xpub6CYWFE1BgTCW2vtbDm1RRT81i3hBkQrXCfGs5hYp211fpgLZV5xCEwXMWPAL3LgaBA9koXpLZSUo7rTyJ8q1JwqKhvzVpdzBKRGyyGb31KF';
      final pubKey2 = TWHDWallet.getPublicKeyFromExtended(
        extended: xpub,
        coin: coin,
        derivationPath: "m/44'/22'/0'/0/2",
      );
      final pubKey9 = TWHDWallet.getPublicKeyFromExtended(
        extended: xpub,
        coin: coin,
        derivationPath: "m/44'/22'/0'/0/9",
      );

      final address2 = TWAnyAddress.createWithPublicKey(pubKey2, coin);
      final address2String = address2.description;

      final address9 = TWAnyAddress.createWithPublicKey(pubKey9, coin);
      final address9String = address9.description;

      expect(address2String, 'MCoYzbqdsMYTBbjr7rd2zJsSF32QMgZCSj');
      expect(address9String, 'MAtduu1Fvtv1Frx6vbg5tZDZwirCA3y8qq');
    });

    test('LockScripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'mona1qw508d6qejxtdg4y5r3zarvary0c5xw7kg5lnx5', coin);
      final scriptData = script.data;
      expectHex(scriptData, '0014751e76e8199196d454941c45d1b3a323f1433bd6');

      final script2 = TWBitcoinScript.lockScriptForAddress(
          'PCTzdjWauNipkYtToRZEHDMXb2adj9Evp8', coin);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a9142a84cf00d47f699ee7bbc1dea5ec1bdecb4ac15487');

      final script3 = TWBitcoinScript.lockScriptForAddress(
          'MBamfEqEFDy5dsLWwu48BCizM1zpCoKw3U', coin);
      final scriptData3 = script3.data;
      expectHex(
          scriptData3, '76a91428662c67561b95c79d2257d2a93d9d151c977e9188ac');
    });
  });
}

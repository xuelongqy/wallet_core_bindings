import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('Groestlcoin', () {
    const coin = TWCoinType.Groestlcoin;

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '3c3385ddc6fd95ba7282051aeb440bc75820b8c10db5c83c052d7586e3e98e84');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address =
          TWGroestlcoinAddress.createWithPublicKey(publicKey, coin.p2pkhPrefix);
      final addressString = address.description;
      expect(addressString, 'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM');

      expect(TWGroestlcoinAddress.isValidString(addressString), true);

      final address2 =
          TWGroestlcoinAddress('Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM');
      final address2String = address2.description;
      expect(address2String, 'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM');

      expect(address, address2);

      // invalid address
      final address3 = TWGroestlcoinAddress('Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLo');
      expect(address3.pointer, 0);
    });

    test('BuildForLegacyAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a91498af0aaca388a7e1024f505c033626d908e3b54a88ac');
    });

    test('BuildForSegwitP2SHAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          '31inaRqambLsd9D7Ke4USZmGEVd3PHkh7P', coin);
      final scriptData = script.data;
      expectHex(scriptData, 'a9140055b0c94df477ee6b9f75185dfc9aa8ce2e52e487');
    });

    test('BuildForNativeSegwitAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'grs1qw4teyraux2s77nhjdwh9ar8rl9dt7zww8r6lne', coin);
      final scriptData = script.data;
      expectHex(scriptData, '00147557920fbc32a1ef4ef26bae5e8ce3f95abf09ce');
    });

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
          'all all all all all all all all all all all all');

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
          'xprv9zHDfLCJPTf5UrS16CrJ56WzSSoAYhJriX8Lfsco3TtPhG2DkwkVXjaDxZKU5USfmq5xjp1CZhpSrpHAPFwZWN75egb19TxWmMMmkd3csxP');
      expect(xpub,
          'xpub6DGa4qjCDqDNhLWUCEPJSETizUdexA2i5k3wUG2QboRNa4MNJV4k5XthorGcogStY5K5iJ6NHtsznNK599ir8PmA3d1jqEoZHsixDTddNA9');

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
          'yprvAJkRD9AD6QrU1hvSdcJT1Cdc1DwEMsBHFt4Gqd5NsK8Vhdn3ArEHYGaJhWotcn24VWx9rC6dDutHNea9zws8owL1qWEt3pVD2GGk4DSXyvm');
      expect(ypub,
          'ypub6Xjmceh6vnQmEBzujdqTNLaLZFmimKu8d6yse1UzRefUaS7BiPYY64tnYpQQydp1gnb2cGkccBd1RtHRDtGXagqmRLxTStV88GWaeYh8ndG');

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
          'zprvAcXuP1BeFt59rhLMnqTEL9j2TUz5mzXkj8NPcfvLKGzHm5mofJAeJMvFzzbNizahKxVEvptBpSxdhBcGbxdbaFP58caWLWAjZWMT7Jb6pFW');
      expect(zpub,
          'zpub6qXFnWiY6FdT5BQptrzEhHfm1WpaBTFc6MHzR4KwscXGdt6xCqUtrAEjrHdeEsjaYEwVMgjtTvENQ83yo2fmkYYGjTpJoH7vFWKQJp1bg1X');
    });

    test('DeriveFromZpub', () {
      const zpub =
          'zpub6qXFnWiY6FdT5BQptrzEhHfm1WpaBTFc6MHzR4KwscXGdt6xCqUtrAEjrHdeEsjaYEwVMgjtTvENQ83yo2fmkYYGjTpJoH7vFWKQJp1bg1X';
      final pubKey4 = TWHDWallet.getPublicKeyFromExtended(
        extended: zpub,
        coin: coin,
        derivationPath: "m/84'/17'/0'/0/4",
      );
      final pubKey11 = TWHDWallet.getPublicKeyFromExtended(
        extended: zpub,
        coin: coin,
        derivationPath: "m/84'/17'/0'/0/11",
      );

      final address4 = TWAnyAddress.createWithPublicKey(pubKey4, coin);
      final address4String = address4.description;

      final address11 = TWAnyAddress.createWithPublicKey(pubKey11, coin);
      final address11String = address11.description;

      expect(address4String, 'grs1quwq6ml2r8rc25tue5ltfa6uc4pdzhtzul3c0rk');
      expect(address11String, 'grs1ql0a7czm8wrj253h78dm2h5j2k89zwpy2qjq0q9');
    });
  });
}

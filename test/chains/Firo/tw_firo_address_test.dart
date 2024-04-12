import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TWZCoin', () {
    const coin = TWCoinType.TWCoinTypeFiro;

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a22ddec5c567b4488bb00f69b6146c50da2ee883e2c096db098726394d585730');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWBitcoinAddress.createWithPublicKey(
          publicKey, TWCoinTypeP2pkhPrefix(coin));
      final addressString = address.description;
      expect(addressString, 'aAbqxogrjdy2YHVcnQxFHMzqpt2fhjCTVT');
    });

    test('ExchangeAddress_CreateWithString', () {
      final address = TWAnyAddress('aJtPAs49k2RYonsUoY9SGgmpzv4awdPfVP', coin);
      final addressData = address.data;
      expectHex(addressData, 'c7529bf17541410428c7b23b402761acb83fdfba');

      final exchangeAddress =
          TWAnyAddress('EXXYdhSMM9Em5Z3kzdUWeUm2vFMNyXFSAEE9', coin);
      final exchangeAddressData = exchangeAddress.data;
      expectHex(
          exchangeAddressData, 'c7529bf17541410428c7b23b402761acb83fdfba');
    });

    test('ExchangeAddress_DeriveFromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '034cc1963365aa67d35643f419d6601eca6ef7f62e46bf7f8b6ffa64e2f44fd0bf',
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      final address = TWAnyAddress.createWithPublicKeyFiroAddressType(
        publicKey,
        TWFiroAddressType.TWFiroAddressTypeExchange,
      );
      final addressDesc = address.description;
      expect(addressDesc, 'EXXWKhUtcaFKVW1NeRFuqPq33zAJMtQJwR4y');

      final defaultAddress = TWAnyAddress.createWithPublicKeyFiroAddressType(
        publicKey,
        TWFiroAddressType.TWFiroAddressTypeDefault,
      );
      final defaultAddressDesc = defaultAddress.description;
      expect(defaultAddressDesc, 'aGaPDQKakaqVmQXGawLMLguZoqSx6CnSfK');
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

      expect(xpub,
          'xpub6Cb8Q6pDeS8PdKNbDv9Hvq4WpJXL3JvKvmHHwR1wD2H543hiCUE1f1tB5AXE6yg13k7xZ6PzEXMNUFHXk6kkx4RYte8VB1i4tCX9rwQVR4a');
      expect(xprv,
          'xprv9ybmzbHKp4a6QqJ87tcHZh7nGGgqdrCUZYMh92cKegk6BFNZevum7DZhDuVDqqMdcBT9B4wJSEmwJW9JNdkMcUUjEWKqppxNrJjKFSyKsCr');
    });

    test('DeriveFromXpub', () {
      final xpub =
          'xpub6Cb8Q6pDeS8PdKNbDv9Hvq4WpJXL3JvKvmHHwR1wD2H543hiCUE1f1tB5AXE6yg13k7xZ6PzEXMNUFHXk6kkx4RYte8VB1i4tCX9rwQVR4a';
      final pubKey3 =
          TWHDWallet.getPublicKeyFromExtended(xpub, coin, "m/44'/136'/0'/0/3");
      final pubKey5 =
          TWHDWallet.getPublicKeyFromExtended(xpub, coin, "m/44'/136'/0'/0/5");

      final address3 = TWBitcoinAddress.createWithPublicKey(
          pubKey3, TWCoinTypeP2pkhPrefix(coin));
      final address3String = address3.description;

      final address5 = TWBitcoinAddress.createWithPublicKey(
          pubKey5, TWCoinTypeP2pkhPrefix(coin));
      final address5String = address5.description;

      expect(address3String, 'aLnztJEbyACnxF9H7SFC8YjUxedwyQsgVm');
      expect(address5String, 'aJj2jdMzHyKFJLEFTxhpn379avEqRKFUyw');
    });

    test('LockScripts', () {
      final script2 = TWBitcoinScript.lockScriptForAddress(
          'a4YtT82mWWxHZhLmdx7e5aroW92dqJoRs3', coin);
      final scriptData2 = script2.data;
      expectHex(
          scriptData2, '76a9142a10f88e30768d2712665c279922b9621ce58bc788ac');

      final script3 = TWBitcoinScript.lockScriptForAddress(
          '4CFa4fnAQvFz4VpikGNzQ9XfCDXMmdk6sh', coin);
      final scriptData3 = script3.data;
      expectHex(scriptData3, 'a914f010b17a9189e0f2737d71ae9790359eb5bbc13787');
    });
  });
}

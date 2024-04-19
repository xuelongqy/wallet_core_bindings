import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TWAnyAddressNervos', () {
    const coin = TWCoinType.TWCoinTypeNervos;

    test('AddressFromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb');
      expect(privateKey.pointer != nullptr, true);
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      expect(publicKey.pointer != nullptr, true);
      expect(publicKey.data.length, 33);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressString = address.description;
      expect(
          addressString,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwy"
          "k5x9erg8furras980hksatlslfaktks7epf25");
    });

    test('AddressFromString', () {
      final address = TWAnyAddress(
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthy"
          "waa50xwsqwyk5x9erg8furras980hksatlslfaktks7epf25",
          coin);
      expect(address.pointer != nullptr, true);
      final addressString = address.description;
      expect(
          addressString,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwy"
          "k5x9erg8furras980hksatlslfaktks7epf25");
    });

    test('AddressFromWallet', () {
      final hdWallet = TWHDWallet.createWithMnemonic(
          "alpha draw toss question picnic endless recycle wrong enable roast success palm");
      final privateKey = hdWallet.getKeyForCoin(coin);
      final privateKeyData = privateKey.data;
      expect(privateKeyData.length, 32);

      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final publicKeyData = publicKey.data;
      expect(publicKeyData.length, 33);
      expectHex(publicKeyData,
          '026c9e4cbb95d4b3a123c1fc80795feacc38029683a1b3e16bccf49bba25fb2858');

      final address = TWCoinTypeDeriveAddress(coin, privateKey);
      expect(
          address,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8f"
          "urras980hksatlslfaktks7epf25");
    });
  });
}

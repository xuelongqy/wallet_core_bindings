import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('Stratis', () {
    const coin = TWCoinType.TWCoinTypeStratis;

    test('LegacyAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'a22ddec5c567b4488bb00f69b6146c50da2ee883e2c096db098726394d585730');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWBitcoinAddress.createWithPublicKey(
          publicKey, TWCoinTypeP2pkhPrefix(coin));
      final addressString = address.description;
      expect(addressString, 'XMEd53bqmNitpFX1cUd1tV6LRME4pcuaPe');
    });

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '55f9cbb0376c422946fa28397c1219933ac60b312ede41bfacaf701ecd546625');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressString = address.description;
      expect(addressString, 'strax1qytnqzjknvv03jwfgrsmzt0ycmwqgl0as6zdq3n');
    });

    test('LockScriptForLegacyAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'XWqnSWzQA5kDAS727UTYtXkdcbKc8mEvyN', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a914d5d068b60f3b63a5a59cc7b8609ac85b76b1896388ac');
    });

    test('LockScriptForAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'strax1qqktrryxg23qjxmnhmz9xsp8w4kkfqv7c2xl6t7', coin);
      final scriptData = script.data;
      expectHex(scriptData, '001405963190c85441236e77d88a6804eeadac9033d8');
    });

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );
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
          'xprv9xyQ71PNhXBFdiY9xAs76X1Y4YzejPv9qe6tKBQ4pEemnmk6b4iFnV1BpJThm2en26emssc558vqHPujDyBKDdSkrNtQiHwbzpQNobWyvh9');
      expect(xpub,
          'xpub6BxkWWvGXtjYrCcd4CQ7TexGcaq98re1Cs2V7ZogNaBkfa5F8c2WLHKffYrwmJdNQztsd3oJvdmHuhN79c8qKpASRtavBsbcUq1R5SxeQtq');
    });

    test('DeriveFromXpub', () {
      final xpub =
          'xpub6BxkWWvGXtjYrCcd4CQ7TexGcaq98re1Cs2V7ZogNaBkfa5F8c2WLHKffYrwmJdNQztsd3oJvdmHuhN79c8qKpASRtavBsbcUq1R5SxeQtq';
      final pubKey2 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/105105'/0'/0/2");
      final pubKey9 = TWHDWallet.getPublicKeyFromExtended(
          extended: xpub, coin: coin, derivationPath: "m/44'/105105'/0'/0/9");

      final address2 = TWBitcoinAddress.createWithPublicKey(
          pubKey2, TWCoinTypeP2pkhPrefix(coin));
      final address2String = address2.description;

      final address9 = TWBitcoinAddress.createWithPublicKey(
          pubKey9, TWCoinTypeP2pkhPrefix(coin));
      final address9String = address9.description;

      expect(address2String, 'XC4QM1nSbHrLb8sWMf4qXcphocqSAMNLng');
      expect(address9String, 'XM4ixdCpyqF86RhKwWRyUXFxXHNypRXiyL');
    });
  });
}

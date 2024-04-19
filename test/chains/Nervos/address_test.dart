import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('NervosAddress', () {
    const coin = TWCoinType.TWCoinTypeNervos;

    test('Valid', () {
      expect(
        TWAnyAddress.isValid(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9e"
            "rg8furras980hksatlslfaktks7epf25",
            coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            "ckb1qyqvfdgvtjxswncx8mq2wl0dp6hlp7nmvhdqcecnt6", coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            "ckb1qjda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xw3394p3wg6"
            "p60qclvpfmaa582lu860dja5h0fk0v",
            coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9"
            "erg8furras980hksatlslfaktks7epf26",
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            "ckb1qyqvfdgvtjxswncx8mq2wl0dp6hlp7nmvhdqcecnt7", coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            "ckb1qjda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xw3394p3wg"
            "6p60qclvpfmaa582lu860dja5h0fk0w",
            coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      final privaKey = TWPrivateKey.createWithHexString(
          '8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb');
      final publicKey =
          privaKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(
          address.description,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9er"
          "g8furras980hksatlslfaktks7epf25");
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '026c9e4cbb95d4b3a123c1fc80795feacc38029683a1b3e16bccf49bba25fb2858',
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(
          address.description,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9er"
          "g8furras980hksatlslfaktks7epf25");
    });

    test('FromString', () {
      final address = TWAnyAddress(
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8fu"
          "rras980hksatlslfaktks7epf25",
          coin);
      expect(
          address.description,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9e"
          "rg8furras980hksatlslfaktks7epf25");
      final address2 =
          TWAnyAddress("ckb1qyqvfdgvtjxswncx8mq2wl0dp6hlp7nmvhdqcecnt6", coin);
      expect(address2.description,
          "ckb1qyqvfdgvtjxswncx8mq2wl0dp6hlp7nmvhdqcecnt6");
      final address3 = TWAnyAddress(
          "ckb1qjda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xw3394p3wg6p60qc"
          "lvpfmaa582lu860dja5h0fk0v",
          coin);
      expect(
          address3.description,
          "ckb1qjda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xw3394p3wg6"
          "p60qclvpfmaa582lu860dja5h0fk0v");
    });

    test('AddressFromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb');
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      expect(publicKey.data.length, 33);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(
          address.description,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9er"
          "g8furras980hksatlslfaktks7epf25");
    });

    test('AddressFromString', () {
      final address = TWAnyAddress(
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8fur"
          "ras980hksatlslfaktks7epf25",
          coin);
      expect(
          address.description,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9er"
          "g8furras980hksatlslfaktks7epf25");
    });

    test('AddressFromWallet', () {
      final hdWallet = TWHDWallet.createWithMnemonic(
          "alpha draw toss question picnic endless recycle wrong enable roast success palm");
      final addressString = hdWallet.getAddressForCoin(coin);
      expect(
          addressString,
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8f"
          "urras980hksatlslfaktks7epf25");
    });
  });
}

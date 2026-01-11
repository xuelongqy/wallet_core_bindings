import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('NEOAddress', () {
    const coin = TWCoinType.NEO;

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0222b2277d039d67f4197a638dd5a1d99c290b17aa8c4a16ccee5165fe612de66a',
        TWPublicKeyType.SECP256k1,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'AKmrAHRD9ZDUnu4m3vWWonpsojo4vgSuqp');
    });

    test('FromString', () {
      const neoAddress = "AXkgwcMJTy9wTAXHsbyhauxh7t2Tt31MmC";
      final address = TWAnyAddress(neoAddress, coin);
      expect(address.description, neoAddress);
    });

    test('isValid', () {
      const neoAddress = "AQAsqiyHS4SSVWZ4CmMmnCxWg7vJ84GEj4";
      const bitcoinAddress = "1Ma2DrB78K7jmAwaomqZNRMCvgQrNjE2QC";

      expect(TWAnyAddress.isValid(neoAddress, coin), true);
      expect(TWAnyAddress.isValid(bitcoinAddress, coin), false);
    });

    test('validation', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(
          TWAnyAddress.isValid('abeb60f3e94c1b9a09f33669435e7ef12eacd', coin),
          false);
      expect(
          TWAnyAddress.isValid(
              'abcb60f3e94c9b9a09f33669435e7ef1beaedads', coin),
          false);
      expect(TWAnyAddress.isValid('ANDfjwrUroaVtvBguDtrWKRMyxFwvVwnZD', coin),
          true);
    });

    test('fromPubKey', () {
      final address = TWAnyAddress.createWithPublicKey(
        TWPublicKey.createWithHexString(
          '031bec1250aa8f78275f99a6663688f31085848d0ed92f1203e447125f927b7486',
          TWPublicKeyType.NIST256p1,
        ),
        coin,
      );
      expect('AeicEjZyiXKgUeSBbYQHxsU1X3V5Buori5', address.description);
    });

    test('fromString', () {
      const b58Str = "AYTxeseHT5khTWhtWX1pFFP1mbQrd4q1zz";
      final address = TWAnyAddress(b58Str, coin);
      expect(address.description, b58Str);
      const errB58Str = "AATxeseHT5khTWhtWX1pFFP1mbQrd4q1zz";
      expect(TWAnyAddress(errB58Str, coin).pointer, 0);
    });

    test('Vaild', () {
      expect(
        TWAnyAddress.isValid('ANDfjwrUroaVtvBguDtrWKRMyxFwvVwnZD', coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('ANDfjwrUr54515515155WKRMyxFwvVwnZD', coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      final key = TWPrivateKey.createWithHexString(
          '0x2A9EAB0FEC93CD94FA0A209AC5604602C1F0105FB02EAB398E17B4517C2FFBAB');
      final publicKey = key.getPublicKeyNist256p1();
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'AQCSMB3oSDA1dHPn6GXN6KB4NHmdo1fX41');
    });
  });
}

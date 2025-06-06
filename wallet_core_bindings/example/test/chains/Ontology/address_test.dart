import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('OntologyAddress', () {
    const coin = TWCoinType.Ontology;

    test('validation', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(
        TWAnyAddress.isValid('abeb60f3e94c1b9a09f33669435e7ef12eacd', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('abcb60f3e94c9b9a09f33669435e7ef1beaedads', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('ANDfjwrUroaVtvBguDtrWKRMyxFwvVwnZD', coin),
        true,
      );
    });

    test('fromPubKey', () {
      final address = TWAnyAddress.createWithPublicKey(
        TWPublicKey.createWithHexString(
            '031bec1250aa8f78275f99a6663688f31085848d0ed92f1203e447125f927b7486',
            TWPublicKeyType.SECP256k1),
        coin,
      );
      expect(address.description, 'AeicEjZyiXKgUeSBbYQHxsU1X3V5Buori5');
    });

    test('fromString', () {
      const b58Str = "AYTxeseHT5khTWhtWX1pFFP1mbQrd4q1zz";
      final address = TWAnyAddress(b58Str, coin);
      expect(address.description, b58Str);
      const errB58Str = "AATxeseHT5khTWhtWX1pFFP1mbQrd4q1zz";
      expect(TWAnyAddress(errB58Str, coin).pointer, 0);
    });
  });
}

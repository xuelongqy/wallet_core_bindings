import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('NimiqAddress', () {
    const coin = TWCoinType.Nimiq;

    test('IsValid', () {
      // No address
      expect(TWAnyAddress.isValid('', coin), false);
      // Invalid country code
      expect(
        TWAnyAddress.isValid(
            'DE86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA', coin),
        false,
      );
      // Invalid checksum
      expect(
        TWAnyAddress.isValid(
            'NQ42 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA', coin),
        false,
      );
      // Too short
      expect(
        TWAnyAddress.isValid(
            'NQ86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0ML', coin),
        false,
      );
      // Too long
      expect(
        TWAnyAddress.isValid(
            'NQ86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA 0MLA', coin),
        false,
      );
      // Is not Base32
      expect(
        TWAnyAddress.isValid(
            'NQ86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR ####', coin),
        false,
      );
      // Invalid checksum
      expectWasmWithException(
          () => TWAnyAddress.isValid(
            'NQXX 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA', coin),
        false,
      );
      // Valid, without spaces
      expect(
        TWAnyAddress.isValid('NQ862H8FYGU5RM77QSN9LYLHC56ACYYR0MLA', coin),
        true,
      );
      // Valid, normal format
      expect(
        TWAnyAddress.isValid(
            'NQ86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA', coin),
        true,
      );
    });

    test('String', () {
      // With spaces
      expect(
        TWAnyAddress('NQ86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA', coin)
            .description,
        "NQ86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA",
      );
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '70c7492aaa9c9ac7a05bc0d9c5db2dae9372029654f71f0c7f95deed5099b702',
        coin.publicKeyType,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(
          address.description, 'NQ27 GBAY EVHP HK5X 6JHV JGFJ 5M3H BF4Y G7GD');
    });
  });
}

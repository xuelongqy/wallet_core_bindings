import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('AeternityAddress', () {
    const coin = TWCoinType.Aeternity;

    // `TWAnyAddressIsValid` must catch exceptions and return false.
    test('IsValid', () {
      expect(
        TWAnyAddress.isValid('invalid', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('behave@wallet', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('a', coin),
        false,
      );
    });
  });
}

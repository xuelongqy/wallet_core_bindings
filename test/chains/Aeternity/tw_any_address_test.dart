import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('AeternityAddress', () {
    const coin = TWCoinType.TWCoinTypeAeternity;

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

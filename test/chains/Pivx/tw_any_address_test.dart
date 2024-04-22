import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TWPivx', () {
    const coin = TWCoinType.TWCoinTypePivx;

    test('Address', () {
      var string = 'DSHhD6WxT5RfG2deUzVfuC1jDuRfdDpsSo';
      var addr = TWAnyAddress(string, coin);
      var string2 = addr.description;
      expect(string, string2);
      var keyHash = addr.data;
      expectHex(keyHash, 'e7fae8ee6ecabaab1252f3b27679cb34f2406169');

      string = 'D6E4vLacYhKc6RVxLNQg5j8rtWbAH8fybH';
      addr = TWAnyAddress(string, coin);
      string2 = addr.description;
      expect(string, string2);
      keyHash = addr.data;
      expectHex(keyHash, '0be8da968f9bc6c1c16b8c635544e757aade7013');
    });
  });
}

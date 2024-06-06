import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNebl', () {
    const coin = TWCoinType.Nebl;

    test('Address', () {
      const string = 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc';
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;
      expect(string, string2);
      final keyHash = addr.data;
      expectHex(keyHash, 'ae40b2142aba5ddd10f74d9440bfda8a36cbad5b');
    });
  });
}

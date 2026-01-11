import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWTBinanceCoinType', () {
    test('TWCoinType', () {
      const string = 'tbnb18mtcq20875cr0p7l4upm0u5zx4r9jpj2kfu9f8';
      final addr = TWAnyAddress(string, TWCoinType.TBinance);
      final string2 = addr.description;
      expect(string, string2);

      final keyHash = addr.data;
      expectHex(keyHash, '3ed78029e7f5303787dfaf03b7f282354659064a');
    });
  });
}

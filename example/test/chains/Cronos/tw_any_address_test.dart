import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('CronosAnyAddress', () {
    test('Validate', () {
      const string = '0xEC49280228b0D05Aa8e8b756503254e1eE7835ab';

      final addr = TWAnyAddress(string, TWCoinType.CronosChain);

      final keyHash = addr.data;
      expectHex(keyHash, 'ec49280228b0d05aa8e8b756503254e1ee7835ab');
    });
  });
}

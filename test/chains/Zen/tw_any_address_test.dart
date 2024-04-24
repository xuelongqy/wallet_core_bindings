import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TWZen', () {
    const coin = TWCoinType.TWCoinTypeZen;

    test('Address', () {
      final string = 'znfexeyosWvMG93AjJx6CkRzKtS2aBdDgAx';
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;
      expect(string, string2);
      final keyHash = addr.data;
      expectHex(keyHash, '9fd1b64dad29d82b151206f66057bab1dae2f517');
    });
  });
}

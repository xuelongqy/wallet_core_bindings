import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWGoChainCoinType', () {
    const coin = TWCoinType.TWCoinTypeGoChain;

    test('TWCoinType', () {
      final string = '0x5aaeb6053f3e94c9b9a09f33669435e7ef1beaed';
      final addr = TWAnyAddress(string, coin);
      final actual = addr.description;
      final expected = "0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed";
      expect(actual, expected);
    });
  });
}

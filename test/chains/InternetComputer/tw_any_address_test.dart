import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWInternetComputer', () {
    const coin = TWCoinType.TWCoinTypeInternetComputer;

    test('Address', () {
      final string =
          '58b26ace22a36a0011608a130e84c7cf34ba469c38d24ccf606152ce7de91f4e';
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;
      expect(string, string2);
    });
  });
}

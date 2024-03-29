import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  group('THORChainAnyAddress', () {
    const coin = TWCoinType.TWCoinTypeTHORChain;

    test('IsValid', () {
      expect(
        TWAnyAddress.isValid(
            'thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'thor1c8jd7ad9pcw4k3wkuqlkz4auv95mldr2kyhc65', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'cosmos1hsk6jryyqjfhp5dhc55tc9jtckygx0eph6dd02', coin),
        false,
      );
    });

    test('Create', () {
      final string = 'thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r';
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;
      expect(string, string2);
      final keyHash = addr.data;
      expectHex(keyHash, '1522e767db6eb19708b0038029bfbd607bc9bd0e');
    });
  });
}

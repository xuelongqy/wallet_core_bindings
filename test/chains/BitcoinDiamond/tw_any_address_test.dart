import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TWBitcoinDiamond', () {
    final coin = TWCoinType.TWCoinTypeBitcoinDiamond;

    test('Address', () {
      var string = '3CDf39adX4mc1AnvDzYHjw2NhxKswAPV3y';
      var addr = TWAnyAddress(string, coin);
      var string2 = addr.description;
      expect(string, string2);
      var keyHash = addr.data;
      expectHex(keyHash, '737cb7c194ec6502be59ed985d66b8bfe8b2b986');

      string = '1DH9cvKqGgzCvwoap45Nh75qV62wqje9pJ';
      addr = TWAnyAddress(string, coin);
      string2 = addr.description;
      expect(string, string2);
      keyHash = addr.data;
      expectHex(keyHash, '86af5c1d5e754fc8906ec3c5d26e0135e1cb7c85');

      // swgwit address
      string = 'bcd1q35t4g0ezx9cl5qzac4tl377n9492uztqjwf5wh';
      addr = TWAnyAddress(string, coin);
      string2 = addr.description;
      expect(string, string2);
      keyHash = addr.data;
      expectHex(keyHash, '8d17543f223171fa005dc557f8fbd32d4aae0960');
    });
  });
}

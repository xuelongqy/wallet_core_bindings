import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TWKomodo', () {
    const coin = TWCoinType.TWCoinTypeKomodo;

    test('Address', () {
      final string = 'RALiENnMMjyubc38hM31h6oicPsuWdAMYg';
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;
      expect(string, string2);
      final keyHash = addr.data;
      expectHex(keyHash, '0ba28b3eebfe1d39dab038324be2c66090ee21a3');
    });
  });
}

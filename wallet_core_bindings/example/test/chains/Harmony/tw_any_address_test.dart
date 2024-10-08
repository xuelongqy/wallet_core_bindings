import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('HarmonyAnyAddress', () {
    const coin = TWCoinType.Harmony;

    test('Harmony', () {
      const string = 'one1c8dpswxg2p50znzecnq0peuxlxtcm9je7q7yje';
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;

      expect(string, string2);

      final keyHash = addr.data;
      expectHex(keyHash, 'c1da1838c85068f14c59c4c0f0e786f9978d9659');
    });
  });
}

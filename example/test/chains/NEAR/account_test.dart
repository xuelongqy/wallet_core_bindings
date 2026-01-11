import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('NEARAccount', () {
    test('Validation', () {
      expect(TWNEARAccount('a').pointer, 0);
      expect(TWNEARAccount('!?:').pointer, 0);
      expect(
          TWNEARAccount(
                  '11111111111111111111111111111111222222222222222222222222222222223')
              .pointer,
          0);

      expect(
        TWNEARAccount('9902c136629fc630416e50d4f2fef6aff867ea7e.lockup.near')
                .pointer !=
            0,
        true,
      );
      expect(
        TWNEARAccount('app_1.alice.near').pointer != 0,
        true,
      );
      expect(
        TWNEARAccount('test-trust.vlad.near').pointer != 0,
        true,
      );
      expect(
        TWNEARAccount('deadbeef').pointer != 0,
        true,
      );
    });
  });
}

import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('NEARAccount', () {
    test('Validation', () {
      expect(TWNEARAccount('a').pointer, nullptr);
      expect(TWNEARAccount('!?:').pointer, nullptr);
      expect(
          TWNEARAccount(
                  '11111111111111111111111111111111222222222222222222222222222222223')
              .pointer,
          nullptr);

      expect(
        TWNEARAccount('9902c136629fc630416e50d4f2fef6aff867ea7e.lockup.near')
                .pointer !=
            nullptr,
        true,
      );
      expect(
        TWNEARAccount('app_1.alice.near').pointer != nullptr,
        true,
      );
      expect(
        TWNEARAccount('test-trust.vlad.near').pointer != nullptr,
        true,
      );
      expect(
        TWNEARAccount('deadbeef').pointer != nullptr,
        true,
      );
    });
  });
}

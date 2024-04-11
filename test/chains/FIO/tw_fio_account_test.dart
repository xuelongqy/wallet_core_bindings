import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWFIO', () {
    test('Account', () {
      {
        final string = 'FIO6XKiobBGrmPZDaHne47TF25CamjFc3cRe8hs7oAiCN59TbJzes';
        final account = TWFIOAccount(string);
        final description = account.description;
        expect(description, 'rpxtnpsr3gxd');
      }

      {
        final account = TWFIOAccount('lhp1ytjibtea');
        final account2 = TWFIOAccount('wrcjejslfplp');
        final account3 = TWFIOAccount('rewards@wallet');
        final description = account.description;
        final description2 = account2.description;
        final description3 = account3.description;
        expect(description, 'lhp1ytjibtea');
        expect(description2, 'wrcjejslfplp');
        expect(description3, 'rewards@wallet');
      }

      {
        final string = 'asdf19s';
        final string2 = '0x320196ef1b137786be51aa391e78e0a2c756f46b';
        final account = TWFIOAccount(string);
        final account2 = TWFIOAccount(string2);

        expect(account.pointer, nullptr);
        expect(account2.pointer, nullptr);
      }
    });
  });
}

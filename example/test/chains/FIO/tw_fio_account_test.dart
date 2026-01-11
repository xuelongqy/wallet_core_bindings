import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWFIO', () {
    test('Account', () {
      {
        const string = 'FIO6XKiobBGrmPZDaHne47TF25CamjFc3cRe8hs7oAiCN59TbJzes';
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
        const string = 'asdf19s';
        const string2 = '0x320196ef1b137786be51aa391e78e0a2c756f46b';
        final account = TWFIOAccount(string);
        final account2 = TWFIOAccount(string2);

        expect(account.pointer, 0);
        expect(account2.pointer, 0);
      }
    });
  });
}

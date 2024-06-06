import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNEARAccount', () {
    test('description', () {
      {
        const string = 'NEARTDDWrUMdoC2rA1eU6gNrSU2zyGKdR71TNucTvsQHyfAXjKcJb';
        final account = TWNEARAccount(string);
        final description = account.description;
        expect(description,
            '3b83b07cab54824a59c3d3f2e203a7cd913b7fcdc4439595983e2402c2cf791d');
      }

      {
        final account = TWNEARAccount('test.near');
        final description = account.description;

        expect(description, 'test.near');
      }

      {
        const string = 'grate!.near';
        final account = TWNEARAccount(string);
        expect(account.pointer, 0);
      }
    });
  });
}

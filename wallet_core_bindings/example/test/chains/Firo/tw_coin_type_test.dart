import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWFiroCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Firo;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '09a60d58b3d17519a42a8eca60750c33b710ca8f3ca71994192e05c248a2a111';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a8ULhhDgfdSiXJhSZVdhb8EuDc6R3ogsaM';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'firo');
      expect(name, 'Firo');
      expect(symbol, 'FIRO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x7);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://explorer.firo.org/tx/09a60d58b3d17519a42a8eca60750c33b710ca8f3ca71994192e05c248a2a111');
      expect(accUrl,
          'https://explorer.firo.org/address/a8ULhhDgfdSiXJhSZVdhb8EuDc6R3ogsaM');
    });
  });
}

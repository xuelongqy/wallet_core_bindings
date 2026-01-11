import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWQtumCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Qtum;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'qtum');
      expect(name, 'Qtum');
      expect(symbol, 'QTUM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x32);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://qtum.info/tx/t123');
      expect(accUrl, 'https://qtum.info/address/a12');
    });
  });
}

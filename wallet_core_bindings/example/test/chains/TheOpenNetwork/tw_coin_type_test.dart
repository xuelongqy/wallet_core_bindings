import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWTONCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TON;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 'fJXfn0EVhV09HFuEgUHu4Cchb24nUQtIMwSzmzk2tLs=';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'ton');
      expect(name, 'TON');
      expect(symbol, 'TON');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(coin.blockchain, TWBlockchain.TheOpenNetwork);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://tonviewer.com/transaction/fJXfn0EVhV09HFuEgUHu4Cchb24nUQtIMwSzmzk2tLs=');
      expect(accUrl,
          'https://tonviewer.com/EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N');
    });
  });
}

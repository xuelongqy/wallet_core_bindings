import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWDecredCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Decred;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'decred');
      expect(name, 'Decred');
      expect(symbol, 'DCR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Decred);
      expect(coin.p2shPrefix, 0x1a);
      expect(coin.staticPrefix, 0x7);
      expect(txUrl, 'https://dcrdata.decred.org/tx/t123');
      expect(accUrl, 'https://dcrdata.decred.org/address/a12');
    });
  });
}

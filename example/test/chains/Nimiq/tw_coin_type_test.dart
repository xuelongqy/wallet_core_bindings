import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNimiqCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Nimiq;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'nimiq');
      expect(name, 'Nimiq');
      expect(symbol, 'NIM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 5);
      expect(coin.blockchain, TWBlockchain.Nimiq);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://nimiq.watch/#t123');
      expect(accUrl, 'https://nimiq.watch/#a12');
    });
  });
}

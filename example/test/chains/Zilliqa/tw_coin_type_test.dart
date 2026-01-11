import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZilliqaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Zilliqa;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'zilliqa');
      expect(name, 'Zilliqa');
      expect(symbol, 'ZIL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 12);
      expect(coin.blockchain, TWBlockchain.Zilliqa);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://viewblock.io/zilliqa/tx/t123');
      expect(accUrl, 'https://viewblock.io/zilliqa/address/a12');
    });
  });
}

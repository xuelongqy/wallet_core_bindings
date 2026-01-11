import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWAionCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Aion;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);

      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Aion);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://mainnet.aion.network/#/transaction/t123');
      expect(accUrl, 'https://mainnet.aion.network/#/account/a12');
      expect(symbol, 'AION');
      expect(id, 'aion');
      expect(name, 'Aion');
    });
  });
}

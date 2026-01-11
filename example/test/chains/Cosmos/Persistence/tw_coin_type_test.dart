import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWPersistenceCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Persistence;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'BBD9DEE03A8D7538D8E7398217467F4A2B5690D15773E8A6442E6AEEEFA21E64';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'persistence10ys69560pqr6zmqam80g8s0smtjw6p3ugzmy3u';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'persistence');
      expect(name, 'Persistence');
      expect(symbol, 'XPRT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "core-1");
      expect(txUrl,
          'https://www.mintscan.io/persistence/txs/BBD9DEE03A8D7538D8E7398217467F4A2B5690D15773E8A6442E6AEEEFA21E64');
      expect(accUrl,
          'https://www.mintscan.io/persistence/account/persistence10ys69560pqr6zmqam80g8s0smtjw6p3ugzmy3u');
    });
  });
}

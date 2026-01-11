import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWEverscaleCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Everscale;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '781238b2b0d15cd4cd2e2a0a142753750cd5e1b2c8b506fcede75a90e02f1268';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          '0:d2bf59964a05dee84a0dd1ddc0ad83ba44d49719cf843d689dc8b726d0fb59d8';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'everscale');
      expect(name, 'Everscale');
      expect(symbol, 'EVER');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(coin.blockchain, TWBlockchain.Everscale);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://everscan.io/transactions/781238b2b0d15cd4cd2e2a0a142753750cd5e1b2c8b506fcede75a90e02f1268');
      expect(accUrl,
          'https://everscan.io/accounts/0:d2bf59964a05dee84a0dd1ddc0ad83ba44d49719cf843d689dc8b726d0fb59d8');
    });
  });
}

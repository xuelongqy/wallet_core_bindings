import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWHederaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Hedera;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = '0.0.19790-1666769504-858851231';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0.0.19790';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'hedera');
      expect(name, 'Hedera');
      expect(symbol, 'HBAR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Hedera);
      expect(txUrl,
          'https://hashscan.io/mainnet/transaction/0.0.19790-1666769504-858851231');
      expect(accUrl, 'https://hashscan.io/mainnet/account/0.0.19790');
    });
  });
}

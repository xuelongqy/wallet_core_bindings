import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('PactusCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Pactus;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = '';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'pactus');
      expect(name, 'Pactus');
      expect(symbol, 'PAC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(coin.blockchain, TWBlockchain.Pactus);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl, 'https://pacviewer.com/transaction/');
      expect(accUrl, 'https://pacviewer.com/address/');
    });
  });
}

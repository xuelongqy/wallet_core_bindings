import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWCoinTypeBluzelle', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Bluzelle;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'AC026E0EC6E33A77D5EA6B9CEF9810699BC2AD8C5582E007E7857457C6D3B819';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'bluzelle1q9cryfal7u3jvnq6er5ufety20xtzw6ycx2te9';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'bluzelle');
      expect(name, 'Bluzelle');
      expect(symbol, 'BLZ');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://bigdipper.net.bluzelle.com/transactions/AC026E0EC6E33A77D5EA6B9CEF9810699BC2AD8C5582E007E7857457C6D3B819');
      expect(accUrl,
          'https://bigdipper.net.bluzelle.com/account/bluzelle1q9cryfal7u3jvnq6er5ufety20xtzw6ycx2te9');
    });
  });
}

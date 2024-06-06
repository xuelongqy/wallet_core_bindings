import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWAlgorandCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Algorand;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      const txId = 'CR7POXFTYDLC7TV3IXHA7AZKWABUJC52BACLHJQNXAKZJGRPQY3A';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          'J4AEINCSSLDA7LNBNWM4ZXFCTLTOZT5LG3F5BLMFPJYGFWVCMU37EZI2AM';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);

      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Algorand);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://algoexplorer.io/tx/CR7POXFTYDLC7TV3IXHA7AZKWABUJC52BACLHJQNXAKZJGRPQY3A');
      expect(accUrl,
          'https://algoexplorer.io/address/J4AEINCSSLDA7LNBNWM4ZXFCTLTOZT5LG3F5BLMFPJYGFWVCMU37EZI2AM');
      expect(symbol, 'ALGO');
      expect(id, 'algorand');
      expect(name, 'Algorand');
    });
  });
}

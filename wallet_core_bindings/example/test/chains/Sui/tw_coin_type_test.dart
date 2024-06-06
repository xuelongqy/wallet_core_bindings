import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWSuiCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Sui;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = '5i8fbSL6r8yw2xcKmXxwkzHu3wpiyMLsyf2htCvDH8Ao';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          '0x259ff8074ab425cbb489f236e18e08f03f1a7856bdf7c7a2877bd64f738b5015';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'sui');
      expect(name, 'Sui');
      expect(symbol, 'SUI');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(coin.blockchain, TWBlockchain.Sui);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://explorer.sui.io//txblock/5i8fbSL6r8yw2xcKmXxwkzHu3wpiyMLsyf2htCvDH8Ao');
      expect(accUrl,
          'https://explorer.sui.io//address/0x259ff8074ab425cbb489f236e18e08f03f1a7856bdf7c7a2877bd64f738b5015');
    });
  });
}

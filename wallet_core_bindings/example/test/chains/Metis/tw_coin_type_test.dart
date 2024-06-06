import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMetisCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Metis;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x422f2ebbede32d4434ad0cf0ae55d44a84e14d3d5725a760133255b42676d8ce';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xBe9E8Ec25866B21bA34e97b9393BCabBcB4A5C86';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'metis');
      expect(name, 'Metis');
      expect(symbol, 'METIS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://andromeda-explorer.metis.io/tx/0x422f2ebbede32d4434ad0cf0ae55d44a84e14d3d5725a760133255b42676d8ce');
      expect(accUrl,
          'https://andromeda-explorer.metis.io/address/0xBe9E8Ec25866B21bA34e97b9393BCabBcB4A5C86');
    });
  });
}

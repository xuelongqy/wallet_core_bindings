import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWSmartBitcoinCashCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.SmartBitcoinCash;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x6413466b455b17d03c7a8ce2d7f99fec34bcd338628bdd2d0580a21e3197a4d9';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xFeEc227410E1DF9f3b4e6e2E284DC83051ae468F';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'smartbch');
      expect(name, 'Smart Bitcoin Cash');
      expect(symbol, 'BCH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://www.smartscout.cash/tx/0x6413466b455b17d03c7a8ce2d7f99fec34bcd338628bdd2d0580a21e3197a4d9');
      expect(accUrl,
          'https://www.smartscout.cash/address/0xFeEc227410E1DF9f3b4e6e2E284DC83051ae468F');
    });
  });
}

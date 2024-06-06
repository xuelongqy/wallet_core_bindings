import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWDydxCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Dydx;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'F236222E4F7C92FA84711FD6451ED22DD56CBDFA319BFDAFB99A21E4E9B9EC2F';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'dydx1adl7usw7z2dnysyn7wvrghu0u0q6gr7jqs4gtt';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'dydx');
      expect(name, 'dYdX');
      expect(symbol, 'DYDX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0);
      expect(coin.staticPrefix, 0);
      expect(coin.staticPrefix, 0);
      expect(txUrl,
          'https://www.mintscan.io/dydx/tx/F236222E4F7C92FA84711FD6451ED22DD56CBDFA319BFDAFB99A21E4E9B9EC2F');
      expect(accUrl,
          'https://www.mintscan.io/dydx/address/dydx1adl7usw7z2dnysyn7wvrghu0u0q6gr7jqs4gtt');
    });
  });
}

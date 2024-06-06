import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWUmeeCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Umee;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '65B4B52C5F324F2287540847A114F645D89D544D99F793879FB3DBFF2CFEFC84';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'umee16934q0qf4akw8qruy5y8v748rvtxxjckgsecq4';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'umee');
      expect(name, 'Umee');
      expect(symbol, 'UMEE');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "umee-1");
      expect(txUrl,
          'https://www.mintscan.io/umee/txs/65B4B52C5F324F2287540847A114F645D89D544D99F793879FB3DBFF2CFEFC84');
      expect(accUrl,
          'https://www.mintscan.io/umee/account/umee16934q0qf4akw8qruy5y8v748rvtxxjckgsecq4');
    });
  });
}

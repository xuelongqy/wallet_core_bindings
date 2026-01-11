import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWVergeCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Verge;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '8c99979a2b25a46659bff35b238aab1c3158f736f215d99526429c7c96203581';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'DFre88gd87bAZQdnS7dbBLwT6GWiGFMQB6';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'verge');
      expect(name, 'Verge');
      expect(symbol, 'XVG');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Verge);
      expect(coin.p2shPrefix, 0x21);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://verge-blockchain.info/tx/8c99979a2b25a46659bff35b238aab1c3158f736f215d99526429c7c96203581');
      expect(accUrl,
          'https://verge-blockchain.info/address/DFre88gd87bAZQdnS7dbBLwT6GWiGFMQB6');
    });
  });
}

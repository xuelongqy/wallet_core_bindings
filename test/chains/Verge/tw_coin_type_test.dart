import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWVergeCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeVerge;
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
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainVerge);
      expect(TWCoinTypeP2shPrefix(coin), 0x21);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://verge-blockchain.info/tx/8c99979a2b25a46659bff35b238aab1c3158f736f215d99526429c7c96203581');
      expect(accUrl,
          'https://verge-blockchain.info/address/DFre88gd87bAZQdnS7dbBLwT6GWiGFMQB6');
    });
  });
}

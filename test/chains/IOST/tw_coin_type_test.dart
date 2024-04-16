import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWIOSTCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeIOST;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = '7dKQzgTkPBNrZqrQ2Bqhqq132CHGPKANFDtzRsjHRCqx';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '4av8w81EyzUgHonsVWqfs15WM4Vrpgox4BYYQWhNQDVu';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'iost');
      expect(name, 'IOST');
      expect(symbol, 'IOST');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 2);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainIOST);
      expect(TWCoinTypeP2shPrefix(coin), 0x5);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.iost.io/tx/7dKQzgTkPBNrZqrQ2Bqhqq132CHGPKANFDtzRsjHRCqx');
      expect(accUrl,
          'https://explorer.iost.io/account/4av8w81EyzUgHonsVWqfs15WM4Vrpgox4BYYQWhNQDVu');
    });
  });
}

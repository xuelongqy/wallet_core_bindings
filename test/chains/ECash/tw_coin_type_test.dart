import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWECashCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeECash;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '6bc767e69cfacffd954c9e5acd178d3140bf00d094b92c6f6052b517500c553b';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'ecash:pqnqv9lt7e5vjyp0w88zf2af0l92l8rxdg2jj94l5j';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'ecash');
      expect(name, 'eCash');
      expect(symbol, 'XEC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 2);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x5);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.bitcoinabc.org/tx/6bc767e69cfacffd954c9e5acd178d3140bf00d094b92c6f6052b517500c553b');
      expect(accUrl,
          'https://explorer.bitcoinabc.org/address/ecash:pqnqv9lt7e5vjyp0w88zf2af0l92l8rxdg2jj94l5j');
    });
  });
}

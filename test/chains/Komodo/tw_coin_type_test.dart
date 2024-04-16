import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWKomodoCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeKomodo;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'f53bd1a5c0f5dc4b60ba9a1882742ea96faa996e1b870795812a29604dd7829e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'RWvfkt8UjbPWXgeZEcgYmKw2vA1bbAx5t2';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'komodo');
      expect(name, 'Komodo');
      expect(symbol, 'KMD');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainZcash);
      expect(TWCoinTypeP2shPrefix(coin), 0x55);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://kmdexplorer.io//tx/f53bd1a5c0f5dc4b60ba9a1882742ea96faa996e1b870795812a29604dd7829e');
      expect(accUrl,
          'https://kmdexplorer.io//address/RWvfkt8UjbPWXgeZEcgYmKw2vA1bbAx5t2');
    });
  });
}

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWBitcoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeBitcoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0607f62530b68cfcc91c57a1702841dd399a899d0eecda8e31ecca3f52f01df2';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '17A16QmavnUfCW11DAApiJxp7ARnxN5pGX';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'bitcoin');
      expect(name, 'Bitcoin');
      expect(symbol, 'BTC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x5);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://mempool.space/tx/0607f62530b68cfcc91c57a1702841dd399a899d0eecda8e31ecca3f52f01df2');
      expect(accUrl,
          'https://mempool.space/address/17A16QmavnUfCW11DAApiJxp7ARnxN5pGX');
    });
  });

  group('TWBinanceSmartChainLegacyCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeSmartChainLegacy;
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);

      expect(id, 'bsc');
      expect(name, 'Smart Chain Legacy');
      expect(10000714, coin);
    });
  });
}

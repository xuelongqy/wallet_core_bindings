import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWTHORChainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeTHORChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'ADF0899E58C177E2391F22D04E9C5E1C35BB0F75B42B363A0761687907FD9476';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'thor196yf4pq80hjrmz7nnh0ar0ypqg02r0w4dq4mzu';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'thorchain');
      expect(name, 'THORChain');
      expect(symbol, 'RUNE');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainThorchain);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://viewblock.io/thorchain/tx/ADF0899E58C177E2391F22D04E9C5E1C35BB0F75B42B363A0761687907FD9476');
      expect(accUrl,
          'https://viewblock.io/thorchain/address/thor196yf4pq80hjrmz7nnh0ar0ypqg02r0w4dq4mzu');
    });
  });
}
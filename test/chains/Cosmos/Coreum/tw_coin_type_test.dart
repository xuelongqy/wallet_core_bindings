import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWCoreumCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeCoreum;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '32A4AE2AE6AAE31E75EDDADE0AB9F1499ABD5AD8D3F261ADEF2805CD46FF74E7';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'core1zmwdnfpwuymwn0fkwnj2aaje34npd5sqgjxq9v';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'coreum');
      expect(name, 'Coreum');
      expect(symbol, 'CORE');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "coreum-mainnet-1");
      expect(txUrl,
          'https://www.mintscan.io/coreum/txs/32A4AE2AE6AAE31E75EDDADE0AB9F1499ABD5AD8D3F261ADEF2805CD46FF74E7');
      expect(accUrl,
          'https://www.mintscan.io/coreum/account/core1zmwdnfpwuymwn0fkwnj2aaje34npd5sqgjxq9v');
    });
  });
}

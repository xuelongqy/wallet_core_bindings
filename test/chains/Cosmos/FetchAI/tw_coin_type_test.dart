import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWFetchAICoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeFetchAI;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '7EB4F6C26809BA047F81CEFD0889775AC8522B7B8AF559B436083BE7039C5EA6';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'fetch1t3qet68dr0qkmrjtq89lrx837qa2t05265qy6s';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'fetchai');
      expect(name, 'Fetch AI');
      expect(symbol, 'FET');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "fetchhub-4");
      expect(txUrl,
          'https://www.mintscan.io/fetchai/txs/7EB4F6C26809BA047F81CEFD0889775AC8522B7B8AF559B436083BE7039C5EA6');
      expect(accUrl,
          'https://www.mintscan.io/fetchai/account/fetch1t3qet68dr0qkmrjtq89lrx837qa2t05265qy6s');
    });
  });
}

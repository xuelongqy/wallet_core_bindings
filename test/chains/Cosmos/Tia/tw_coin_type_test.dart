import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWTiaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeTia;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'FF370C65D8D67B8236F9D3A8D2B1256337C60C1965092CADD1FA970288FCE99B';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'celestia1tt4tv4jrs4twdtzwywxd8u65duxgk8y73wvfu2';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'tia');
      expect(name, 'Celestia');
      expect(symbol, 'TIA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "celestia");
      expect(txUrl,
          'https://www.mintscan.io/celestia/txs/FF370C65D8D67B8236F9D3A8D2B1256337C60C1965092CADD1FA970288FCE99B');
      expect(accUrl,
          'https://www.mintscan.io/celestia/account/celestia1tt4tv4jrs4twdtzwywxd8u65duxgk8y73wvfu2');
    });
  });
}

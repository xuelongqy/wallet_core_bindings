import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWLineaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeLinea;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x0c7086f96865f4fcad58d7f3449db7baab9fce2625bcb79e7ea26676aa0d3420';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xbf71018f716ca6c64b0b12622f87a26b3b86100f';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'linea');
      expect(name, 'Linea');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '59144');
      expect(txUrl,
          'https://lineascan.build/tx/0x0c7086f96865f4fcad58d7f3449db7baab9fce2625bcb79e7ea26676aa0d3420');
      expect(accUrl,
          'https://lineascan.build/address/0xbf71018f716ca6c64b0b12622f87a26b3b86100f');
    });
  });
}

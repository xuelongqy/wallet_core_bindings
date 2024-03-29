import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWCryptoorgCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeCryptoOrg;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'D87D2EB46B21466886EE149C1DEA3AE6C2E019C7D8C24FA1533A95439DDCE1E2';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'cro10wrflcdc4pys9vvgqm98yg7yv5ltj7d3xehent';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'cryptoorg');
      expect(name, 'Crypto.org');
      expect(symbol, 'CRO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://crypto.org/explorer/tx/D87D2EB46B21466886EE149C1DEA3AE6C2E019C7D8C24FA1533A95439DDCE1E2');
      expect(accUrl,
          'https://crypto.org/explorer/account/cro10wrflcdc4pys9vvgqm98yg7yv5ltj7d3xehent');
    });
  });
}

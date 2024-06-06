import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWKujiraCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Kujira;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '2F5D1B1E0041A86B0590AAD2ED028693E93137A3EA1E614D59FE9B02261BC235';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'kujira13c90ger64wc26s8399rvazceqy273u3n84kgyp';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'kujira');
      expect(name, 'Kujira');
      expect(symbol, 'KUJI');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "kaiyo-1");
      expect(txUrl,
          'https://www.mintscan.io/kujira/txs/2F5D1B1E0041A86B0590AAD2ED028693E93137A3EA1E614D59FE9B02261BC235');
      expect(accUrl,
          'https://www.mintscan.io/kujira/account/kujira13c90ger64wc26s8399rvazceqy273u3n84kgyp');
    });
  });
}

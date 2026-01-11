import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWMarsCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Mars;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'C12120760C71189A678739E0F1FD4EFAF2C29EA660B57A359AC728F89FAA7528';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'mars1nnjy6nct405pzfaqjm3dsyw0pf0kyw72vhw4pr';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'mars');
      expect(name, 'Mars Hub');
      expect(symbol, 'MARS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "mars-1");
      expect(txUrl,
          'https://www.mintscan.io/mars-protocol/txs/C12120760C71189A678739E0F1FD4EFAF2C29EA660B57A359AC728F89FAA7528');
      expect(accUrl,
          'https://www.mintscan.io/mars-protocol/account/mars1nnjy6nct405pzfaqjm3dsyw0pf0kyw72vhw4pr');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWOsmosisCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Osmosis;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '5A6E50A6F2927E4B8C87BB094D5FBF15F1287429A09111806FC44B3CD86CACA8';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'osmo1mky69cn8ektwy0845vec9upsdphktxt0en97f5';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'osmosis');
      expect(name, 'Osmosis');
      expect(symbol, 'OSMO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://mintscan.io/osmosis/txs/5A6E50A6F2927E4B8C87BB094D5FBF15F1287429A09111806FC44B3CD86CACA8');
      expect(accUrl,
          'https://mintscan.io/osmosis/account/osmo1mky69cn8ektwy0845vec9upsdphktxt0en97f5');
    });
  });
}

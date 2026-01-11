import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWComdexCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Comdex;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '04C790D09A40EE958DBDD385B679B5EB60C10F9BC1389CC8F896DC9193A5ED6C';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'comdex1jz7av7cq45gh5hhrugtak7lkps2ga5v0u64nz6';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'comdex');
      expect(name, 'Comdex');
      expect(symbol, 'CMDX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "comdex-1");
      expect(txUrl,
          'https://www.mintscan.io/comdex/txs/04C790D09A40EE958DBDD385B679B5EB60C10F9BC1389CC8F896DC9193A5ED6C');
      expect(accUrl,
          'https://www.mintscan.io/comdex/account/comdex1jz7av7cq45gh5hhrugtak7lkps2ga5v0u64nz6');
    });
  });
}

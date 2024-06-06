import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWRootstockCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Rootstock;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xeb8fa0488a655f8dc975153bffd066800bcaae5f21cf372356365b2a1d6d2288';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x4e5dabc28e4a0f5e5b19fcb56b28c5a1989352c1';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'rootstock');
      expect(name, 'Rootstock');
      expect(symbol, 'RBTC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '30');
      expect(txUrl,
          'https://explorer.rsk.co/tx/0xeb8fa0488a655f8dc975153bffd066800bcaae5f21cf372356365b2a1d6d2288');
      expect(accUrl,
          'https://explorer.rsk.co/address/0x4e5dabc28e4a0f5e5b19fcb56b28c5a1989352c1');
    });
  });
}

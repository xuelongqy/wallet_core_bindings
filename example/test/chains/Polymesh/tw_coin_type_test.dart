import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWPolygonCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Polymesh;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x98cb5e33d8ff3dd5838c384e2ef9e291314ed8db13f5d4f42cdd70bad54a5e04';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '2E5u4xA1TqswQ3jMJH96zekxwr2itvKu79fDC1mmnVZRh6Uv';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'polymesh');
      expect(name, 'Polymesh');
      expect(symbol, 'POLYX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Polymesh);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://polymesh.subscan.io/extrinsic/0x98cb5e33d8ff3dd5838c384e2ef9e291314ed8db13f5d4f42cdd70bad54a5e04');
      expect(accUrl,
          'https://polymesh.subscan.io/account/2E5u4xA1TqswQ3jMJH96zekxwr2itvKu79fDC1mmnVZRh6Uv');
    });
  });
}

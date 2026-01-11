import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWPolygonCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Polygon;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xe26ed1470d5bf99a53d687843e7acdf7e4ba6620af93b4d672e714de90476e8e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x720E1fa107A1Df39Db4E78A3633121ac36Bec132';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'polygon');
      expect(name, 'Polygon');
      expect(symbol, 'POL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://polygonscan.com/tx/0xe26ed1470d5bf99a53d687843e7acdf7e4ba6620af93b4d672e714de90476e8e');
      expect(accUrl,
          'https://polygonscan.com/address/0x720E1fa107A1Df39Db4E78A3633121ac36Bec132');
    });
  });
}

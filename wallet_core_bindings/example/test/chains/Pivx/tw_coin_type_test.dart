import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWPivxCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Pivx;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);

      expect(id, 'pivx');
      expect(name, 'Pivx');
      expect(symbol, 'PIVX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 13);
      expect(coin.p2pkhPrefix, 30);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMonacoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Monacoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'monacoin');
      expect(name, 'Monacoin');
      expect(symbol, 'MONA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x37);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://blockbook.electrum-mona.org/tx/t123');
      expect(accUrl, 'https://blockbook.electrum-mona.org/address/a12');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWViacoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Viacoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'viacoin');
      expect(name, 'Viacoin');
      expect(symbol, 'VIA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x21);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://explorer.viacoin.org/tx/t123');
      expect(accUrl, 'https://explorer.viacoin.org/address/a12');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWDogecoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Dogecoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'doge');
      expect(name, 'Dogecoin');
      expect(symbol, 'DOGE');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x16);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://blockchair.com/dogecoin/transaction/t123');
      expect(accUrl, 'https://blockchair.com/dogecoin/address/a12');
    });
  });
}

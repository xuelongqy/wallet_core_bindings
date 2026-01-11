import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBitcoinCashCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.BitcoinCash;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'bitcoincash');
      expect(name, 'Bitcoin Cash');
      expect(symbol, 'BCH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.BitcoinCash);
      expect(coin.p2shPrefix, 0x5);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://blockchair.com/bitcoin-cash/transaction/t123');
      expect(accUrl, 'https://blockchair.com/bitcoin-cash/address/a12');
    });
  });
}

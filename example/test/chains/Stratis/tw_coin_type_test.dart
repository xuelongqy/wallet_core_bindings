import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWStratisCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Stratis;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '3923df87e83859dec8b87a414cbb1529113788c512a4d0c283e1394c274f0bfb';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'XWqnSWzQA5kDAS727UTYtXkdcbKc8mEvyN';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'stratis');
      expect(name, 'Stratis');
      expect(symbol, 'STRAX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x8c);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://explorer.rutanio.com/strax/explorer/transaction/3923df87e83859dec8b87a414cbb1529113788c512a4d0c283e1394c274f0bfb');
      expect(accUrl,
          'https://explorer.rutanio.com/strax/explorer/address/XWqnSWzQA5kDAS727UTYtXkdcbKc8mEvyN');
    });
  });
}

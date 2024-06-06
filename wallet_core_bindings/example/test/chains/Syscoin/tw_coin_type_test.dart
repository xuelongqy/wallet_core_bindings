import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWSyscoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Syscoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '19e043f76f6ffc960f5fe93ecec37bc37a58ae7525d7e9cd6ed40f71f0da60eb';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'sys1qh3gvhnzq2ch7w8g04x8zksr2mz7r90x7ksmu40';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'syscoin');
      expect(name, 'Syscoin');
      expect(symbol, 'SYS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x5);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://sys1.bcfn.ca/tx/19e043f76f6ffc960f5fe93ecec37bc37a58ae7525d7e9cd6ed40f71f0da60eb');
      expect(accUrl,
          'https://sys1.bcfn.ca/address/sys1qh3gvhnzq2ch7w8g04x8zksr2mz7r90x7ksmu40');
    });
  });
}

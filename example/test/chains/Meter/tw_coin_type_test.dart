import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMeterCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Meter;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x8ea268d5dbb40217c763b800a75fc063cf28b56f40f2bc69dc043f5c4bbdc144';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xe5a273954d24eddf9ae9ea4cef2347d584cfa3dd';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'meter');
      expect(name, 'Meter');
      expect(symbol, 'MTR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://scan.meter.io/tx/0x8ea268d5dbb40217c763b800a75fc063cf28b56f40f2bc69dc043f5c4bbdc144');
      expect(accUrl,
          'https://scan.meter.io/address/0xe5a273954d24eddf9ae9ea4cef2347d584cfa3dd');
    });
  });
}

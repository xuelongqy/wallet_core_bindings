import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZenCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Zen;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'b7f548640766fb024247accf4e01bec37d88d49c4900357edc84d49a09ff4430';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'znRchPtvEyJJUwGbCALqyjwHJb1Gx6z4H4j';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'zen');
      expect(name, 'Zen');
      expect(symbol, 'ZEN');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Zen);
      expect(coin.p2shPrefix, 0x96);
      expect(coin.staticPrefix, 0x20);
      expect(txUrl,
          'https://explorer.horizen.io/tx/b7f548640766fb024247accf4e01bec37d88d49c4900357edc84d49a09ff4430');
      expect(accUrl,
          'https://explorer.horizen.io/address/znRchPtvEyJJUwGbCALqyjwHJb1Gx6z4H4j');
    });
  });
}

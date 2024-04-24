import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWZenCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeZen;
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
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainZen);
      expect(TWCoinTypeP2shPrefix(coin), 0x96);
      expect(TWCoinTypeStaticPrefix(coin), 0x20);
      expect(txUrl,
          'https://explorer.horizen.io/tx/b7f548640766fb024247accf4e01bec37d88d49c4900357edc84d49a09ff4430');
      expect(accUrl,
          'https://explorer.horizen.io/address/znRchPtvEyJJUwGbCALqyjwHJb1Gx6z4H4j');
    });
  });
}

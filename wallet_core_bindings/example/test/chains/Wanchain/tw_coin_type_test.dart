import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWWanchainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Wanchain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x180ea96a3218b82b9b35d796823266d8a425c182507adfe5eeffc96e6a14d856';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x69B492D57bb777e97aa7044D0575228434e2E8B1';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'wanchain');
      expect(name, 'Wanchain');
      expect(symbol, 'WAN');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://www.wanscan.org/tx/0x180ea96a3218b82b9b35d796823266d8a425c182507adfe5eeffc96e6a14d856');
      expect(accUrl,
          'https://www.wanscan.org/address/0x69B492D57bb777e97aa7044D0575228434e2E8B1');
    });
  });
}

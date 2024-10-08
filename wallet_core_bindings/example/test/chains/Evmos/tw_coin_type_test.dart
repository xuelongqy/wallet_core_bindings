import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWCoinTypeEvmos', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Evmos;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x24af42cf4977a96d62e3a82c3cd9b519c3e7c53dd83398b88f0cb435d867b422';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x30627903124Aa1e71384bc52e1cb96E4AB3252b6';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'evmos');
      expect(name, 'Evmos');
      expect(symbol, 'EVMOS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://evm.evmos.org/tx/0x24af42cf4977a96d62e3a82c3cd9b519c3e7c53dd83398b88f0cb435d867b422');
      expect(accUrl,
          'https://evm.evmos.org/address/0x30627903124Aa1e71384bc52e1cb96E4AB3252b6');
    });
  });
}

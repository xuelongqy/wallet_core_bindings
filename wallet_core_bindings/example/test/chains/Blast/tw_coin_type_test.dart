import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBlastCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Blast;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x511fc00e8329343b9e953bf1f75e9b0a7b3cc2eb3a8f049d5be41adf4fbd6cac';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x0d11f2f0ff55c4fcfc3ff86bdc8e78ffa7df99fd';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'blast');
      expect(name, 'Blast');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://blastscan.io/tx/0x511fc00e8329343b9e953bf1f75e9b0a7b3cc2eb3a8f049d5be41adf4fbd6cac');
      expect(accUrl,
          'https://blastscan.io/address/0x0d11f2f0ff55c4fcfc3ff86bdc8e78ffa7df99fd');
    });
  });
}

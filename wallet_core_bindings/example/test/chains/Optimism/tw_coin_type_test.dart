import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWOptimismCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Optimism;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x6fd99288be9bf71eb002bb31da10a4fb0fbbb3c45ae73693b212f49c9db7df8f';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x1f932361e31d206b4f6b2478123a9d0f8c761031';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'optimism');
      expect(name, 'OP Mainnet');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://optimistic.etherscan.io/tx/0x6fd99288be9bf71eb002bb31da10a4fb0fbbb3c45ae73693b212f49c9db7df8f');
      expect(accUrl,
          'https://optimistic.etherscan.io/address/0x1f932361e31d206b4f6b2478123a9d0f8c761031');
    });
  });
}

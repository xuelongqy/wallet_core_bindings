import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBinanceSmartChainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.SmartChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xb9ae2e808fe8e57171f303ad8f6e3fd17d949b0bfc7b4db6e8e30a71cc517d7e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x35552c16704d214347f29Fa77f77DA6d75d7C752';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'smartchain');
      expect(name, 'BNB Smart Chain');
      expect(symbol, 'BNB');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(20000714, coin);
      expect(txUrl,
          'https://bscscan.com/tx/0xb9ae2e808fe8e57171f303ad8f6e3fd17d949b0bfc7b4db6e8e30a71cc517d7e');
      expect(accUrl,
          'https://bscscan.com/address/0x35552c16704d214347f29Fa77f77DA6d75d7C752');
    });
  });

  group('TWBinanceSmartChainLegacyCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.SmartChainLegacy;
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);

      expect(id, 'bsc');
      expect(name, 'Smart Chain Legacy');
      expect(10000714, coin);
    });
  });
}

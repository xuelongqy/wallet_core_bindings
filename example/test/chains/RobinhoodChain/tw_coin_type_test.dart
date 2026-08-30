import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWRobinhoodChainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.RobinhoodChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final nativeTokenName = TWCoinTypeConfiguration.getNativeTokenName(coin);
      const txId =
          '0x60f2d8e8ca8d64da9d3ded83a759a123ea28aca9f51a8f9b62cf34835b770cf9';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x0Bd7D308f8E1639FAb988df18A8011f41EAcAD73';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'robinhoodchain');
      expect(name, 'Robinhood Chain');
      expect(nativeTokenName, 'Ethereum');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://robinhoodchain.blockscout.com/tx/0x60f2d8e8ca8d64da9d3ded83a759a123ea28aca9f51a8f9b62cf34835b770cf9');
      expect(accUrl,
          'https://robinhoodchain.blockscout.com/address/0x0Bd7D308f8E1639FAb988df18A8011f41EAcAD73');
    });
  });
}

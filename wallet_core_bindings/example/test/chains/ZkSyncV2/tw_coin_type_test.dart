import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZksyncCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Zksync;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xae38d3ede1104d088b474da261d0eb4847952c3db24c21e820502f4c1b0c01f5';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xeF86b2c8740518548ae449c4C3892B4be0475d8c';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'zksync');
      expect(name, 'zkSync Era');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '324');
      expect(txUrl,
          'https://explorer.zksync.io/tx/0xae38d3ede1104d088b474da261d0eb4847952c3db24c21e820502f4c1b0c01f5');
      expect(accUrl,
          'https://explorer.zksync.io/address/0xeF86b2c8740518548ae449c4C3892B4be0475d8c');
    });
  });
}

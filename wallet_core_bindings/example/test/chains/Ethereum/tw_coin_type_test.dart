import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWEthereumCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Ethereum;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x9edaf0f7d9c6629c31bbf0471fc07d696c73b566b93783f7e25d8d5d2b62fa4f';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x5bb497e8d9fe26e92dd1be01e32076c8e024d167';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'ethereum');
      expect(name, 'Ethereum');
      expect(symbol, 'ETH');
      expect(chainId, '1');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://etherscan.io/tx/0x9edaf0f7d9c6629c31bbf0471fc07d696c73b566b93783f7e25d8d5d2b62fa4f');
      expect(accUrl,
          'https://etherscan.io/address/0x5bb497e8d9fe26e92dd1be01e32076c8e024d167');
    });
  });
}

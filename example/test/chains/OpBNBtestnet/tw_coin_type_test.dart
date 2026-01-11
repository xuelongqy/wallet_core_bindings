import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWOpBNBtestnetCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.OpBNB;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x788ea8fb4a82dae957f1d3b18af3cd0bbde55a276e66bd17af8c869f24c03a0f';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x4eaf936c172b5e5511959167e8ab4f7031113ca3';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'opbnb');
      expect(name, 'OpBNB');
      expect(symbol, 'BNB');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '204');
      expect(txUrl,
          'https://opbnbscan.com/tx/0x788ea8fb4a82dae957f1d3b18af3cd0bbde55a276e66bd17af8c869f24c03a0f');
      expect(accUrl,
          'https://opbnbscan.com/address/0x4eaf936c172b5e5511959167e8ab4f7031113ca3');
    });
  });
}

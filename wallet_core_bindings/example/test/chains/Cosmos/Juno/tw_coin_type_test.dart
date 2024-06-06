import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWJunoCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Juno;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '3DCE6AAF19657BCF11D44FD6BE124D57B44E04CA34851DE0ECCE619F70ECC46F';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'juno');
      expect(name, 'Juno');
      expect(symbol, 'JUNO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "juno-1");
      expect(txUrl,
          'https://www.mintscan.io/juno/txs/3DCE6AAF19657BCF11D44FD6BE124D57B44E04CA34851DE0ECCE619F70ECC46F');
      expect(accUrl,
          'https://www.mintscan.io/juno/account/juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf');
    });
  });
}

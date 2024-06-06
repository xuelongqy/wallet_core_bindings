import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWSommelierCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Sommelier;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'E73A9E5E534777DDADF7F69A5CB41972894B862D1763FA4081FE913D8D3A5E80';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'somm10d5wmqvezwtj20u5hg3wuvwucce2nhsy0tzqgn';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'sommelier');
      expect(name, 'Sommelier');
      expect(symbol, 'SOMM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "sommelier-3");
      expect(txUrl,
          'https://www.mintscan.io/sommelier/txs/E73A9E5E534777DDADF7F69A5CB41972894B862D1763FA4081FE913D8D3A5E80');
      expect(accUrl,
          'https://www.mintscan.io/sommelier/account/somm10d5wmqvezwtj20u5hg3wuvwucce2nhsy0tzqgn');
    });
  });
}

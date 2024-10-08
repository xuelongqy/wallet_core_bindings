import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWCantoCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.NativeCanto;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'A16C211C83AD1E684DE46F694FAAC17D8465C864BD7385A81EC062CDE0638811';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'canto17xpfvakm2amg962yls6f84z3kell8c5ljcjw34';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'nativecanto');
      expect(name, 'NativeCanto');
      expect(symbol, 'CANTO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "canto_7700-1");
      expect(txUrl,
          'https://mintscan.io/canto/txs/A16C211C83AD1E684DE46F694FAAC17D8465C864BD7385A81EC062CDE0638811');
      expect(accUrl,
          'https://mintscan.io/canto/account/canto17xpfvakm2amg962yls6f84z3kell8c5ljcjw34');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWCantoCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.NativeEvmos;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'A16C211C83AD1E684DE46F694FAAC17D8465C864BD7385A81EC062CDE0638811';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'evmos17xpfvakm2amg962yls6f84z3kell8c5ljcjw34';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'nativeevmos');
      expect(name, 'Native Evmos');
      expect(symbol, 'EVMOS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.NativeEvmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://mintscan.io/evmos/txs/A16C211C83AD1E684DE46F694FAAC17D8465C864BD7385A81EC062CDE0638811');
      expect(accUrl,
          'https://mintscan.io/evmos/account/evmos17xpfvakm2amg962yls6f84z3kell8c5ljcjw34');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWKavaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Kava;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '2988DF83FCBFAA38179D583A96734CBD071541D6768221BB23111BC8136D5E6A';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'kava1xd39avn2f008jmvua0eupg39zsp2xn3wf802vn';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'kava');
      expect(name, 'Kava');
      expect(symbol, 'KAVA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "kava_2222-10");
      expect(txUrl,
          'https://mintscan.io/kava/txs/2988DF83FCBFAA38179D583A96734CBD071541D6768221BB23111BC8136D5E6A');
      expect(accUrl,
          'https://mintscan.io/kava/account/kava1xd39avn2f008jmvua0eupg39zsp2xn3wf802vn');
    });
  });
}

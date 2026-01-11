import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWQuasarCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Quasar;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '2898B89C98FE1E8CF1E05A37E4EE5EE5ED83FD957B0CAEE53DE39FC82BF1A033';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'quasar1cqu6w425slheul3jsmyt6q0ec0rs0w0ugkst3k';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'quasar');
      expect(name, 'Quasar');
      expect(symbol, 'QSR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "quasar-1");
      expect(txUrl,
          'https://www.mintscan.io/quasar/txs/2898B89C98FE1E8CF1E05A37E4EE5EE5ED83FD957B0CAEE53DE39FC82BF1A033');
      expect(accUrl,
          'https://www.mintscan.io/quasar/account/quasar1cqu6w425slheul3jsmyt6q0ec0rs0w0ugkst3k');
    });
  });
}

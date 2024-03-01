import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWAionCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeAion;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);

      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainAion);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://mainnet.aion.network/#/transaction/t123');
      expect(accUrl, 'https://mainnet.aion.network/#/account/a12');
      expect(symbol, 'AION');
      expect(id, 'aion');
      expect(name, 'Aion');
    });
  });
}

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWDecredCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeDecred;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'decred');
      expect(name, 'Decred');
      expect(symbol, 'DCR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainDecred);
      expect(TWCoinTypeP2shPrefix(coin), 0x1a);
      expect(TWCoinTypeStaticPrefix(coin), 0x7);
      expect(txUrl, 'https://dcrdata.decred.org/tx/t123');
      expect(accUrl, 'https://dcrdata.decred.org/address/a12');
    });
  });
}

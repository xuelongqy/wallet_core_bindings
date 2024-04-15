import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWGroestlcoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeGroestlcoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'groestlcoin');
      expect(name, 'Groestlcoin');
      expect(symbol, 'GRS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainGroestlcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x5);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://blockchair.com/groestlcoin/transaction/t123');
      expect(accUrl, 'https://blockchair.com/groestlcoin/address/a12');
    });
  });
}

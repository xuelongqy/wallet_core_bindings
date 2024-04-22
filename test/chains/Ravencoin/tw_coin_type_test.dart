import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWRavencoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeRavencoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'ravencoin');
      expect(name, 'Ravencoin');
      expect(symbol, 'RVN');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x7a);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://blockbook.ravencoin.org/tx/t123');
      expect(accUrl, 'https://blockbook.ravencoin.org/address/a12');
    });
  });
}

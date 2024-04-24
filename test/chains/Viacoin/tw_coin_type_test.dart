import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWViacoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeViacoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'viacoin');
      expect(name, 'Viacoin');
      expect(symbol, 'VIA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x21);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://explorer.viacoin.org/tx/t123');
      expect(accUrl, 'https://explorer.viacoin.org/address/a12');
    });
  });
}

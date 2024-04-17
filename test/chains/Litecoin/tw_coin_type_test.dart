import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWLitecoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeLitecoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'litecoin');
      expect(name, 'Litecoin');
      expect(symbol, 'LTC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x32);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://blockchair.com/litecoin/transaction/t123');
      expect(accUrl, 'https://blockchair.com/litecoin/address/a12');
    });
  });
}

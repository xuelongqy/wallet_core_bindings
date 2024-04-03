import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWDigiByteCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeDigiByte;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'digibyte');
      expect(name, 'DigiByte');
      expect(symbol, 'DGB');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x3f);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://digiexplorer.info/tx/t123');
      expect(accUrl, 'https://digiexplorer.info/address/a12');
    });
  });
}

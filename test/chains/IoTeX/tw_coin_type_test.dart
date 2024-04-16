import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWIoTeXCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeIoTeX;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'iotex');
      expect(name, 'IoTeX');
      expect(symbol, 'IOTX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainIoTeX);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://iotexscan.io/action/t123');
      expect(accUrl, 'https://iotexscan.io/address/a12');
    });
  });
}

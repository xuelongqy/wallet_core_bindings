import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBobaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Boba;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x31533707c3feb3b10f7deeea387ff8893f229253e65ca6b14d2400bf95b5d103';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x4F96F50eDB37a19216d87693E5dB241e31bD3735';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'boba');
      expect(name, 'Boba');
      expect(symbol, 'BOBAETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://blockexplorer.boba.network/tx/0x31533707c3feb3b10f7deeea387ff8893f229253e65ca6b14d2400bf95b5d103');
      expect(accUrl,
          'https://blockexplorer.boba.network/address/0x4F96F50eDB37a19216d87693E5dB241e31bD3735');
    });
  });
}

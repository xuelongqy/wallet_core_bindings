import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWDigiByteCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.DigiByte;
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
      expect(coin.blockchain, TWBlockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x3f);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://digiexplorer.info/tx/t123');
      expect(accUrl, 'https://digiexplorer.info/address/a12');
    });
  });
}

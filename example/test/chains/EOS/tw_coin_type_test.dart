import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWEOSCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.EOS;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'eos');
      expect(name, 'EOS');
      expect(symbol, 'EOS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 4);
      expect(coin.blockchain, TWBlockchain.EOS);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://bloks.io/transaction/t123');
      expect(accUrl, 'https://bloks.io/account/a12');
    });
  });
}

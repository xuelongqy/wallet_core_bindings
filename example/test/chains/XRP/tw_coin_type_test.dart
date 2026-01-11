import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWXRPCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.XRP;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'E26AB8F3372D2FC02DEC1FD5674ADAB762D684BFFDBBDF5D674E9D7CF4A47054';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'rfkH7EuS1XcSkB9pocy1R6T8F4CsNYixYU';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'ripple');
      expect(name, 'XRP');
      expect(symbol, 'XRP');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Ripple);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://bithomp.com/explorer/E26AB8F3372D2FC02DEC1FD5674ADAB762D684BFFDBBDF5D674E9D7CF4A47054');
      expect(accUrl,
          'https://bithomp.com/explorer/rfkH7EuS1XcSkB9pocy1R6T8F4CsNYixYU');
    });
  });
}

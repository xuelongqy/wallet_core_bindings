import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMonadCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Monad;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x8394f9f01bc2ae2cc93e19170bf80c303210f6f4198e5ec3cc99b0cba04962b6';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x6ab69B482987b0BA1f1c96BDbDC192a80CB09132';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'monad');
      expect(name, 'Monad');
      expect(symbol, 'MON');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://monvision.io/tx/0x8394f9f01bc2ae2cc93e19170bf80c303210f6f4198e5ec3cc99b0cba04962b6');
      expect(accUrl,
          'https://monvision.io/address/0x6ab69B482987b0BA1f1c96BDbDC192a80CB09132');
    });
  });
}

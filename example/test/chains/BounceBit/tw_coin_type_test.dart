import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBounceBitCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.BounceBit;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x52558f4143d058d942e3b73414090266ae3ffce1fe8c25fe86896e2c8e5ef932';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xf4aa7349a9ccca4609943955b5ddc7bd9278c223';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'bouncebit');
      expect(name, 'BounceBit');
      expect(symbol, 'BB');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://bbscan.io/tx/0x52558f4143d058d942e3b73414090266ae3ffce1fe8c25fe86896e2c8e5ef932');
      expect(accUrl,
          'https://bbscan.io/address/0xf4aa7349a9ccca4609943955b5ddc7bd9278c223');
    });
  });
}

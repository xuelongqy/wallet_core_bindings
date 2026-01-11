import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZelcashCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Zelcash;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'zelcash');
      expect(name, 'Flux');
      expect(symbol, 'FLUX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Zcash);
      expect(coin.p2shPrefix, 0xbd);
      expect(coin.staticPrefix, 0x1c);
      expect(txUrl, 'https://explorer.runonflux.io/tx/t123');
      expect(accUrl, 'https://explorer.runonflux.io/address/a12');
    });
  });
}

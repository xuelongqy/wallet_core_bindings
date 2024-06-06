import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNeblCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Nebl;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '53713d5208e2a1bc68ef8bd5c851f113cf5e1675d22ecf3406f38819ab9187b3';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'Nebl');
      expect(name, 'Nebl');
      expect(symbol, 'NEBL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Verge);
      expect(coin.p2shPrefix, 0x70);
      expect(coin.p2pkhPrefix, 0x35);
      expect(txUrl,
          'https://explorer.nebl.io/tx/53713d5208e2a1bc68ef8bd5c851f113cf5e1675d22ecf3406f38819ab9187b3');
      expect(accUrl,
          'https://explorer.nebl.io/address/NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc');
    });
  });
}

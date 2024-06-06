import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMantaPacificCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.MantaPacific;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x2bbd5d85b0ed05d1416e30ce1197a6f0c27d10ce02593a2719e2baf486d2e8c2';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xF122a1aC569a36a5Cf6d0F828A22254c8A9afF84';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'manta');
      expect(name, 'Manta Pacific');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://pacific-explorer.manta.network/tx/0x2bbd5d85b0ed05d1416e30ce1197a6f0c27d10ce02593a2719e2baf486d2e8c2');
      expect(accUrl,
          'https://pacific-explorer.manta.network/address/0xF122a1aC569a36a5Cf6d0F828A22254c8A9afF84');
    });
  });
}

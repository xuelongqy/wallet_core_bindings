import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWPolkadotCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Polkadot;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xb96f97d8ee508f420e606e1a6dcc74b88844713ddec2bd7cf4e3aa6b1d6beef4';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '13hJFqnkqQbmgnGQteGntjMjTdmTBRE8Z93JqxsrpgT7Yjd2';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'polkadot');
      expect(name, 'Polkadot');
      expect(symbol, 'DOT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 10);
      expect(coin.blockchain, TWBlockchain.Polkadot);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://polkadot.subscan.io/extrinsic/0xb96f97d8ee508f420e606e1a6dcc74b88844713ddec2bd7cf4e3aa6b1d6beef4');
      expect(accUrl,
          'https://polkadot.subscan.io/account/13hJFqnkqQbmgnGQteGntjMjTdmTBRE8Z93JqxsrpgT7Yjd2');
    });
  });
}

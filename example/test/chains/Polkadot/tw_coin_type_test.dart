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
      final nativeTokenName = TWCoinTypeConfiguration.getNativeTokenName(coin);
      const txId =
          '0x5aaaeec678ab1bd5a19d2c9bfd596037a32e3d1e831383c62f315459e85fa85d';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '13hJFqnkqQbmgnGQteGntjMjTdmTBRE8Z93JqxsrpgT7Yjd2';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'polkadot');
      expect(name, 'Polkadot');
      expect(nativeTokenName, 'Polkadot');
      expect(symbol, 'DOT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 10);
      expect(coin.blockchain, TWBlockchain.Polkadot);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://assethub-polkadot.subscan.io/extrinsic/0x5aaaeec678ab1bd5a19d2c9bfd596037a32e3d1e831383c62f315459e85fa85d');
      expect(accUrl,
          'https://assethub-polkadot.subscan.io/account/13hJFqnkqQbmgnGQteGntjMjTdmTBRE8Z93JqxsrpgT7Yjd2');
    });
  });
}

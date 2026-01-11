import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWNativeInjectiveCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.NativeInjective;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'C5F6A4FF9DF1AE9FF543D2CEBD8E3E9B04290B2445F9D91D7707EDBF4B7EE16B';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'inj1xmpkmxr4as00em23tc2zgmuyy2gr4h3wgcl6vd';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'nativeinjective');
      expect(name, 'Native Injective');
      expect(symbol, 'INJ');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.NativeInjective);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, 'injective-1');
      expect(txUrl,
          'https://www.mintscan.io/injective/txs/C5F6A4FF9DF1AE9FF543D2CEBD8E3E9B04290B2445F9D91D7707EDBF4B7EE16B');
      expect(accUrl,
          'https://www.mintscan.io/injective/account/inj1xmpkmxr4as00em23tc2zgmuyy2gr4h3wgcl6vd');
    });
  });
}

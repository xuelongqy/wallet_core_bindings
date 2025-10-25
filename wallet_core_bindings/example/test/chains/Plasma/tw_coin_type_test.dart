import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWPlasmaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Plasma;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x3700212ec535b4c804363be87ba8a5f5668de6314ed41978f6ad71c5340d4d77';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x30A3E1F27B60c095E2c87bce1e2ffB24f381C8cd';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'plasma');
      expect(name, 'Plasma Mainnet');
      expect(symbol, 'XPL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://plasmascan.to/tx/0x3700212ec535b4c804363be87ba8a5f5668de6314ed41978f6ad71c5340d4d77');
      expect(accUrl,
          'https://plasmascan.to/address/0x30A3E1F27B60c095E2c87bce1e2ffB24f381C8cd');
    });
  });
}

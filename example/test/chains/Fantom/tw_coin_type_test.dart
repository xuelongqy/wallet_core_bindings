import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWFantomCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Fantom;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xb0a741d882291951de1fac72e90b9baf886ddb0c9c87658a0c206490dfaa5202';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x9474feb9917b87da6f0d830ba66ee0035835c0d3';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'fantom');
      expect(name, 'Fantom');
      expect(symbol, 'FTM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://ftmscan.com/tx/0xb0a741d882291951de1fac72e90b9baf886ddb0c9c87658a0c206490dfaa5202');
      expect(accUrl,
          'https://ftmscan.com/address/0x9474feb9917b87da6f0d830ba66ee0035835c0d3');
    });
  });
}

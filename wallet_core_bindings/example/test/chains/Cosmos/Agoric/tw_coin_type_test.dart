import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWAgoricCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Agoric;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '576224B1A0F3D56BA23C5350C2A0E3CEA86F40005B828793E5ACBC2F4813152E';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'agoric1cqvwa8jr6pmt45jndanc8lqmdsxjkhw0yertc0';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'agoric');
      expect(name, 'Agoric');
      expect(symbol, 'BLD');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "agoric-3");
      expect(txUrl,
          'https://atomscan.com/agoric/transactions/576224B1A0F3D56BA23C5350C2A0E3CEA86F40005B828793E5ACBC2F4813152E');
      expect(accUrl,
          'https://atomscan.com/agoric/accounts/agoric1cqvwa8jr6pmt45jndanc8lqmdsxjkhw0yertc0');
    });
  });
}

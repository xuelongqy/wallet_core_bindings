import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWTerraCoinType', () {
    test('TWCoinType20', () {
      const coin = TWCoinType.TerraV2;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'CFF732C6EBEE06FFA08ABE54EE1657FD53E90FAA81604619E2062C46572A6986';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'terra16t3gx5rqvz6ru37yzn3shuu20erv4ngmfr59zf';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'terrav2');
      expect(name, 'Terra');
      expect(symbol, 'LUNA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://finder.terra.money/mainnet/tx/CFF732C6EBEE06FFA08ABE54EE1657FD53E90FAA81604619E2062C46572A6986');
      expect(accUrl,
          'https://finder.terra.money/mainnet/address/terra16t3gx5rqvz6ru37yzn3shuu20erv4ngmfr59zf');
    });
  });
}

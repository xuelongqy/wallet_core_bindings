import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWNobleCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Noble;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'EA231079975A058FEC28EF372B445763918C098DE033E868E2E035F3F98C59C7';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'noble1y2egevq0nyzm7w6a9kpxkw86eqytcvxpwsp6d9';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'noble');
      expect(name, 'Noble');
      expect(symbol, 'USDC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "noble-1");
      expect(txUrl,
          'https://www.mintscan.io/noble/txs/EA231079975A058FEC28EF372B445763918C098DE033E868E2E035F3F98C59C7');
      expect(accUrl,
          'https://www.mintscan.io/noble/account/noble1y2egevq0nyzm7w6a9kpxkw86eqytcvxpwsp6d9');
    });
  });
}

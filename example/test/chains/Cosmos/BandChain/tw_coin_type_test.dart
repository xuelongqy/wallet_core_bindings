import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWBandChainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.BandChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '74AF38C2183B06EB6274DA4AAC0D2334E6E283643D436852F5E088AEA2CD0B17';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'band16gpgu994g2gdrzvwp9047le3pcq9wz6mcgtd4w';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'band');
      expect(name, 'BandChain');
      expect(symbol, 'BAND');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://www.mintscan.io/band/tx/74AF38C2183B06EB6274DA4AAC0D2334E6E283643D436852F5E088AEA2CD0B17');
      expect(accUrl,
          'https://www.mintscan.io/band/account/band16gpgu994g2gdrzvwp9047le3pcq9wz6mcgtd4w');
    });
  });
}

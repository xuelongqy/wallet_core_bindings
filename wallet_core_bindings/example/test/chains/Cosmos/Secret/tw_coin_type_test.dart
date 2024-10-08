import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWSecretCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Secret;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '026B4886B1D9CE836A99755DDE99D4F8A7748D27B1CE9D298A763B1CFFF62C00';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'secret167m3s89ddurjpyr82vsluvvj0t8ylzn95trrqy';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'secret');
      expect(name, 'Secret');
      expect(symbol, 'SCRT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, 'secret-4');
      expect(txUrl,
          'https://mintscan.io/secret/txs/026B4886B1D9CE836A99755DDE99D4F8A7748D27B1CE9D298A763B1CFFF62C00');
      expect(accUrl,
          'https://mintscan.io/secret/account/secret167m3s89ddurjpyr82vsluvvj0t8ylzn95trrqy');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWVeChainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.VeChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xa424053be0063555aee73a595ca69968c2e4d90d36f280753e503b92b11a655d';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x8a0a035a33173601bfbec8b6ae7c4a6557a55103';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'vechain');
      expect(name, 'VeChain');
      expect(symbol, 'VET');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Vechain);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://explore.vechain.org/transactions/0xa424053be0063555aee73a595ca69968c2e4d90d36f280753e503b92b11a655d');
      expect(accUrl,
          'https://explore.vechain.org/accounts/0x8a0a035a33173601bfbec8b6ae7c4a6557a55103');
    });
  });
}

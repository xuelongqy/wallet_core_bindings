import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNEARCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.NEAR;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 'FPQAMaVnvFHNwNBJWnTttXfdJhp5FvMGGDJEesB8gvbL';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'test-trust.vlad.near';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'near');
      expect(name, 'NEAR');
      expect(symbol, 'NEAR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 24);
      expect(coin.blockchain, TWBlockchain.NEAR);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://nearblocks.io/txns/FPQAMaVnvFHNwNBJWnTttXfdJhp5FvMGGDJEesB8gvbL');
      expect(accUrl, 'https://nearblocks.io/address/test-trust.vlad.near');
    });
  });
}

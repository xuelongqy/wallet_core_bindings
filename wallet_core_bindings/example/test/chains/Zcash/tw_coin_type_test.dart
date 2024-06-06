import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZcashCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Zcash;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'f2438a93039faf08d39bd3df1f7b5f19a2c29ffe8753127e2956ab4461adab35';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 't1Yfrf1dssDLmaMBsq2LFKWPbS5vH3nGpa2';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'zcash');
      expect(name, 'Zcash');
      expect(symbol, 'ZEC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Zcash);
      expect(coin.p2shPrefix, 0xbd);
      expect(coin.staticPrefix, 0x1c);
      expect(txUrl,
          'https://blockchair.com/zcash/transaction/f2438a93039faf08d39bd3df1f7b5f19a2c29ffe8753127e2956ab4461adab35');
      expect(accUrl,
          'https://blockchair.com/zcash/address/t1Yfrf1dssDLmaMBsq2LFKWPbS5vH3nGpa2');
    });
  });
}

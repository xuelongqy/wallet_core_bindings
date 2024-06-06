import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNULSCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.NULS;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '303e0e42c28acc37ba952a1effd43daa1caec79928054f7abefb21c32e6fdc02';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'NULSd6HgdSjUZy7jKMZfvQ5QU6Z97oufGTGcF';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'nuls');
      expect(name, 'NULS');
      expect(symbol, 'NULS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.NULS);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://nulscan.io/transaction/info?hash=303e0e42c28acc37ba952a1effd43daa1caec79928054f7abefb21c32e6fdc02');
      expect(accUrl,
          'https://nulscan.io/address/info?address=NULSd6HgdSjUZy7jKMZfvQ5QU6Z97oufGTGcF');
    });
  });
}

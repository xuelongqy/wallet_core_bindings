import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBitcoinDiamondCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.BitcoinDiamond;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'ec564fe8993ba77f3f5c8b7f6ebb4cbc08e564a54612d6f4584cd1017cf723d4';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '1HNTyntGXNhy4WxNzWfffPqp7LHb8bGJ9R';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'bitcoindiamond');
      expect(name, 'Bitcoin Diamond');
      expect(symbol, 'BCD');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 7);
      expect(coin.blockchain, TWBlockchain.BitcoinDiamond);
      expect(coin.p2shPrefix, 0x5);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'http://explorer.btcd.io/#/tx?tx=ec564fe8993ba77f3f5c8b7f6ebb4cbc08e564a54612d6f4584cd1017cf723d4');
      expect(accUrl,
          'http://explorer.btcd.io/#/address?address=1HNTyntGXNhy4WxNzWfffPqp7LHb8bGJ9R');
    });
  });
}

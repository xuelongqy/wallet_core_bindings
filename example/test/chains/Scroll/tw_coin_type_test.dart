import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWScrollCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Scroll;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xa2062a4530b194a438bb9f9e87cdce59f70775a52e8336892364445847c43ca2';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xf9062b8a30e0d7722960e305049fa50b86ba6253';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'scroll');
      expect(name, 'Scroll');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '534352');
      expect(txUrl,
          'https://scrollscan.com/tx/0xa2062a4530b194a438bb9f9e87cdce59f70775a52e8336892364445847c43ca2');
      expect(accUrl,
          'https://scrollscan.com/address/0xf9062b8a30e0d7722960e305049fa50b86ba6253');
    });
  });
}

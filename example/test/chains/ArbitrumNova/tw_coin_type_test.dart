import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWArbitrumNovaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.ArbitrumNova;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final chainId = coin.chainId;
      const txId =
          '0xfdfee13848c2d21813c82c53afc9925f31770564c3117477960a81055702c1be';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x0d0707963952f2fba59dd06f2b425ace40b492fe';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'arbitrumnova');
      expect(name, 'Arbitrum Nova');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '42170');
      expect(txUrl,
          'https://nova.arbiscan.io/tx/0xfdfee13848c2d21813c82c53afc9925f31770564c3117477960a81055702c1be');
      expect(accUrl,
          'https://nova.arbiscan.io/address/0x0d0707963952f2fba59dd06f2b425ace40b492fe');
    });
  });
}

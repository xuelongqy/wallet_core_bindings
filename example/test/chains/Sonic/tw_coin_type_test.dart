import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWSonicCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Sonic;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x886c34de9e054c741b2bcb15c3a3e0382e3ed7a48f2c6f2a489f6d82abdd4a7c';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x9c174f0e2d11559447e5fe2815d930475be19016';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'sonic');
      expect(name, 'Sonic');
      expect(symbol, 'S');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2pkhPrefix, 0x0);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://sonicscan.org/tx/0x886c34de9e054c741b2bcb15c3a3e0382e3ed7a48f2c6f2a489f6d82abdd4a7c');
      expect(accUrl,
          'https://sonicscan.org/address/0x9c174f0e2d11559447e5fe2815d930475be19016');
    });
  });
}

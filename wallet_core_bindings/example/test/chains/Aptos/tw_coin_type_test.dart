import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWAlgorandCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Aptos;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xedc88058e27f6c065fd6607e262cb2a83a65f74301df90c61923014c59f9d465';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          '0x60ad80e8cdadb81399e8a738014bc9ec865cef842f7c2cf7d84fbf7e40d065';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'aptos');
      expect(name, 'Aptos');
      expect(symbol, 'APT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.Aptos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://explorer.aptoslabs.com/txn/0xedc88058e27f6c065fd6607e262cb2a83a65f74301df90c61923014c59f9d465');
      expect(accUrl,
          'https://explorer.aptoslabs.com/account/0x60ad80e8cdadb81399e8a738014bc9ec865cef842f7c2cf7d84fbf7e40d065');
    });
  });
}

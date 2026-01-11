import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWStellarCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Stellar;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '8a7ff7261e8b3f31af7f6ed257c2e9fe7c47afcd9b1ce1be1bfc1bc5f6a3ad9e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'GCILJZQ3CKBKBUJWW4TAM6Q37LJA5MQX6GMSFSQN75BPLWIZ33OPRG52';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'stellar');
      expect(name, 'Stellar');
      expect(symbol, 'XLM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 7);
      expect(coin.blockchain, TWBlockchain.Stellar);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://blockchair.com/stellar/transaction/8a7ff7261e8b3f31af7f6ed257c2e9fe7c47afcd9b1ce1be1bfc1bc5f6a3ad9e');
      expect(accUrl,
          'https://blockchair.com/stellar/account/GCILJZQ3CKBKBUJWW4TAM6Q37LJA5MQX6GMSFSQN75BPLWIZ33OPRG52');
    });
  });
}

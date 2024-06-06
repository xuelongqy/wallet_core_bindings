import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBaseCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Base;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final chainId = coin.chainId;
      const txId =
          '0x4acb15506b7696a2dfac4258f3f86392b4b2b717a3f316a8aa78509b2c3b6ab4';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xb8ff877ed78ba520ece21b1de7843a8a57ca47cb';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'base');
      expect(name, 'Base');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '8453');
      expect(txUrl,
          'https://basescan.org/tx/0x4acb15506b7696a2dfac4258f3f86392b4b2b717a3f316a8aa78509b2c3b6ab4');
      expect(accUrl,
          'https://basescan.org/address/0xb8ff877ed78ba520ece21b1de7843a8a57ca47cb');
    });
  });
}

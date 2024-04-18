import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWMultiversXCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeMultiversX;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '163b46551a74626415074b626d2f37d3c78aef0f6ccb628db434ee65a35ea127';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          'erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'elrond');
      expect(name, 'MultiversX');
      expect(symbol, 'eGLD');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainMultiversX);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.multiversx.com/transactions/163b46551a74626415074b626d2f37d3c78aef0f6ccb628db434ee65a35ea127');
      expect(accUrl,
          'https://explorer.multiversx.com/accounts/erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th');
    });
  });
}

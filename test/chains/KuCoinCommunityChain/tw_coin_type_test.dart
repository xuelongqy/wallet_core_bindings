import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWKuCoinCommunityChainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeKuCoinCommunityChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x2f0d79cd289a02f3181b68b9583a64c3809fe7387810b274275985c29d02c80d';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x4446fc4eb47f2f6586f9faab68b3498f86c07521';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'kcc');
      expect(name, 'KuCoin Community Chain');
      expect(symbol, 'KCS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.kcc.io/en/tx/0x2f0d79cd289a02f3181b68b9583a64c3809fe7387810b274275985c29d02c80d');
      expect(accUrl,
          'https://explorer.kcc.io/en/address/0x4446fc4eb47f2f6586f9faab68b3498f86c07521');
    });
  });
}
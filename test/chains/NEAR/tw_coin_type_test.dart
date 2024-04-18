import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWNEARCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeNEAR;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 'FPQAMaVnvFHNwNBJWnTttXfdJhp5FvMGGDJEesB8gvbL';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'test-trust.vlad.near';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'near');
      expect(name, 'NEAR');
      expect(symbol, 'NEAR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 24);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainNEAR);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://nearblocks.io/txns/FPQAMaVnvFHNwNBJWnTttXfdJhp5FvMGGDJEesB8gvbL');
      expect(accUrl, 'https://nearblocks.io/address/test-trust.vlad.near');
    });
  });
}

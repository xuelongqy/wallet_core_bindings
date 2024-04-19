import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWNeonCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeNeon;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x77d86af2c6f02f14ef13ca52bf54864d92fcc4b32d8e884e225061c006738ed6';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xfa4a8650e7bebb918859c280a86f9661bed29877';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'neon');
      expect(name, 'Neon');
      expect(symbol, 'NEON');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '245022934');
      expect(txUrl,
          'https://neonscan.org/tx/0x77d86af2c6f02f14ef13ca52bf54864d92fcc4b32d8e884e225061c006738ed6');
      expect(accUrl,
          'https://neonscan.org/address/0xfa4a8650e7bebb918859c280a86f9661bed29877');
    });
  });
}

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWSolanaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeSolana;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '5LmxrEKGchhMuYfw6Qut6CbsvE9pVfb8YvwZKvWssSesDVjHioBCmWKSJQh1WhvcM6CpemhpHNmEMA2a36rzwTa8';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'Bxp8yhH9zNwxyE4UqxP7a7hgJ5xTZfxNNft7YJJ2VRjT';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'solana');
      expect(name, 'Solana');
      expect(symbol, 'SOL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainSolana);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://solscan.io/tx/5LmxrEKGchhMuYfw6Qut6CbsvE9pVfb8YvwZKvWssSesDVjHioBCmWKSJQh1WhvcM6CpemhpHNmEMA2a36rzwTa8');
      expect(accUrl,
          'https://solscan.io/account/Bxp8yhH9zNwxyE4UqxP7a7hgJ5xTZfxNNft7YJJ2VRjT');
    });
  });
}

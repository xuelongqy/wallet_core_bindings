import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWArbitrumCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeArbitrum;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xa1e319be22c08155e5904aa211fb87df5f4ade48de79c6578b1cf3dfda9e498c';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          '0xecf9ffa7f51e1194f89c25ad8c484f6bfd04e1ac';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'arbitrum');
      expect(name, 'Arbitrum');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(txUrl,
          'https://arbiscan.io/tx/0xa1e319be22c08155e5904aa211fb87df5f4ade48de79c6578b1cf3dfda9e498c');
      expect(accUrl,
          'https://arbiscan.io/address/0xecf9ffa7f51e1194f89c25ad8c484f6bfd04e1ac');
    });
  });
}

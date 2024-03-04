import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWAvalancheCoinType', () {
    test('TWCoinTypeCChain', () {
      const coin = TWCoinType.TWCoinTypeAvalancheCChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x9243890b844219accefd8798271052f5a056453ec18984a56e81c92921330d54';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xa664325f36Ec33E66323fe2620AF3f2294b2Ef3A';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'avalanchec');
      expect(name, 'Avalanche C-Chain');
      expect(symbol, 'AVAX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://snowtrace.io/tx/0x9243890b844219accefd8798271052f5a056453ec18984a56e81c92921330d54');
      expect(accUrl,
          'https://snowtrace.io/address/0xa664325f36Ec33E66323fe2620AF3f2294b2Ef3A');
    });
  });
}

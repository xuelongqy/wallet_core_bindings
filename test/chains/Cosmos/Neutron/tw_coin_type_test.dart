import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWNeutronCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeNeutron;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'E18BA087009A05EB6A15A22FE30BA99379B909F74A74120E6F92B9882C45F0D7';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'neutron1pm4af8pcurxssdxztqw9rexx5f8zfq7uzqfmy8';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'neutron');
      expect(name, 'Neutron');
      expect(symbol, 'NTRN');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "neutron-1");
      expect(txUrl,
          'https://www.mintscan.io/neutron/txs/E18BA087009A05EB6A15A22FE30BA99379B909F74A74120E6F92B9882C45F0D7');
      expect(accUrl,
          'https://www.mintscan.io/neutron/account/neutron1pm4af8pcurxssdxztqw9rexx5f8zfq7uzqfmy8');
    });
  });
}
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWPOANetworkCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypePOANetwork;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'poa');
      expect(name, 'POA Network');
      expect(symbol, 'POA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://blockscout.com/poa/core/tx/t123');
      expect(accUrl, 'https://blockscout.com/poa/core/address/a12');
    });
  });
}

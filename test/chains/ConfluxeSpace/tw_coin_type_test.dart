import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWConfluxeSpaceCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeConfluxeSpace;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x920efefb3213b2d6a3b84149cb50b61a813d085443a20e1b0eab74120e41ff72';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x337a087daef75c72871de592fbbba570829a936a';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'cfxevm');
      expect(name, 'Conflux eSpace');
      expect(symbol, 'CFX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "1030");
      expect(txUrl,
          'https://evm.confluxscan.net/tx/0x920efefb3213b2d6a3b84149cb50b61a813d085443a20e1b0eab74120e41ff72');
      expect(accUrl,
          'https://evm.confluxscan.net/address/0x337a087daef75c72871de592fbbba570829a936a');
    });
  });
}

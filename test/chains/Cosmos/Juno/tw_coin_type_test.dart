import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWJunoCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeJuno;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '3DCE6AAF19657BCF11D44FD6BE124D57B44E04CA34851DE0ECCE619F70ECC46F';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'juno');
      expect(name, 'Juno');
      expect(symbol, 'JUNO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "juno-1");
      expect(txUrl,
          'https://www.mintscan.io/juno/txs/3DCE6AAF19657BCF11D44FD6BE124D57B44E04CA34851DE0ECCE619F70ECC46F');
      expect(accUrl,
          'https://www.mintscan.io/juno/account/juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf');
    });
  });
}
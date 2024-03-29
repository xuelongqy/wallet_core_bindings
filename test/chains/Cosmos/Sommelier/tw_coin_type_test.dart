import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWSommelierCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeSommelier;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'E73A9E5E534777DDADF7F69A5CB41972894B862D1763FA4081FE913D8D3A5E80';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'somm10d5wmqvezwtj20u5hg3wuvwucce2nhsy0tzqgn';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'sommelier');
      expect(name, 'Sommelier');
      expect(symbol, 'SOMM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "sommelier-3");
      expect(txUrl,
          'https://www.mintscan.io/sommelier/txs/E73A9E5E534777DDADF7F69A5CB41972894B862D1763FA4081FE913D8D3A5E80');
      expect(accUrl,
          'https://www.mintscan.io/sommelier/account/somm10d5wmqvezwtj20u5hg3wuvwucce2nhsy0tzqgn');
    });
  });
}

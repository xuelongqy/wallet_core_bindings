import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWAuroraCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeAurora;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x99deebdb70f8027037abb3d3d0f3c7523daee857d85e9056d2671593ff2f2f28';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x8707cdE20dd43E3dB1F74c28fcd509ef38B0bA51';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'aurora');
      expect(name, 'Aurora');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://aurorascan.dev/tx/0x99deebdb70f8027037abb3d3d0f3c7523daee857d85e9056d2671593ff2f2f28');
      expect(accUrl,
          'https://aurorascan.dev/address/0x8707cdE20dd43E3dB1F74c28fcd509ef38B0bA51');
    });
  });
}

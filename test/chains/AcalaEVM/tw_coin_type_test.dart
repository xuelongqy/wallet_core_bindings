import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWAcalaEVMCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeAcalaEVM;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final chainId = TWCoinTypeChainId(coin);
      const txId =
          '0x4b0b151dd71ed8ef3174da18565790bf14f0a903a13e4f3266c7848bc8841593';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x9d1d97aDFcd324Bbd603D3872BD78e04098510b1';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'acalaevm');
      expect(name, 'Acala EVM');
      expect(symbol, 'ACA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '787');
      expect(txUrl,
          'https://blockscout.acala.network/tx/0x4b0b151dd71ed8ef3174da18565790bf14f0a903a13e4f3266c7848bc8841593');
      expect(accUrl,
          'https://blockscout.acala.network/address/0x9d1d97aDFcd324Bbd603D3872BD78e04098510b1');
    });
  });
}

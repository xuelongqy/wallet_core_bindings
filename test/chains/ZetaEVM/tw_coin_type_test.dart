import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWZetaEVMCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeZetaEVM;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x04cb1201857de29af97b755e51c888454fb96c1f3bb3c1329bb94d5353d5c19e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x85539A58F9c88DdDccBaBBfc660968323Fd1e167';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'zetaevm');
      expect(name, 'Zeta EVM');
      expect(symbol, 'ZETA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '7000');
      expect(txUrl,
          'https://explorer.zetachain.com/evm/tx/0x04cb1201857de29af97b755e51c888454fb96c1f3bb3c1329bb94d5353d5c19e');
      expect(accUrl,
          'https://explorer.zetachain.com/address/0x85539A58F9c88DdDccBaBBfc660968323Fd1e167');
    });
  });
}

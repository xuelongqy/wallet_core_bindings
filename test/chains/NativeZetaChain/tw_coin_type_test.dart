import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWNativeZetaChainCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeNativeZetaChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '2DBB071DDD47985F4470A21E5943CE95D371AE4BDE2267E201D3553FB2BDCFDE';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'zeta14py36sx57ud82t9yrks9z6hdsrpn5x6kmxs0ne';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'zetachain');
      expect(name, 'NativeZetaChain');
      expect(symbol, 'ZETA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(TWCoinTypeP2pkhPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.zetachain.com/cosmos/tx/2DBB071DDD47985F4470A21E5943CE95D371AE4BDE2267E201D3553FB2BDCFDE');
      expect(accUrl,
          'https://explorer.zetachain.com/address/zeta14py36sx57ud82t9yrks9z6hdsrpn5x6kmxs0ne');
    });
  });
}

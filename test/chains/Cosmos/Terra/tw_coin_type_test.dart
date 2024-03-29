import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWTerraCoinType', () {
    test('TWCoinTypeClassic', () {
      const coin = TWCoinType.TWCoinTypeTerra;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'D28D8AFC7CE89F2A22FA2DBF78D2C0A36E549BB830C4D9FA7459E3F723CA7182';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'terra16t3gx5rqvz6ru37yzn3shuu20erv4ngmfr59zf';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'terra');
      expect(name, 'Terra Classic');
      expect(symbol, 'LUNC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "columbus-5");
      expect(txUrl,
          'https://finder.terra.money/classic/tx/D28D8AFC7CE89F2A22FA2DBF78D2C0A36E549BB830C4D9FA7459E3F723CA7182');
      expect(accUrl,
          'https://finder.terra.money/classic/address/terra16t3gx5rqvz6ru37yzn3shuu20erv4ngmfr59zf');
    });
  });
}

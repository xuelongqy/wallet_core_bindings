import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWAkashCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeAkash;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'C0083856344425908D5333D4325E3E0DE9D697BA568C6D99C34303819F615D25';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'akash1f4nskxfw8ufhwnajh7xwt0wmdtxm02vwta6krg';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'akash');
      expect(name, 'Akash');
      expect(symbol, 'AKT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "akashnet-2");
      expect(txUrl,
          'https://www.mintscan.io/akash/txs/C0083856344425908D5333D4325E3E0DE9D697BA568C6D99C34303819F615D25');
      expect(accUrl,
          'https://www.mintscan.io/akash/account/akash1f4nskxfw8ufhwnajh7xwt0wmdtxm02vwta6krg');
    });
  });
}

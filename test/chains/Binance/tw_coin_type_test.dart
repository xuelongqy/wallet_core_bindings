import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWBinanceCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeBinance;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final chainId = TWCoinTypeChainId(coin);
      const txId =
          'A93625C9F9ABEA1A8E31585B30BBB16C34FAE0D172EB5B6B2F834AF077BF06BB';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'bnb1u7jm0cll5h3224y0tapwn6gf6pr49ytewx4gsz';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'binance');
      expect(name, 'BNB Beacon Chain');
      expect(symbol, 'BNB');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBinance);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, 'Binance-Chain-Tigris');
      expect(txUrl,
          'https://explorer.binance.org/tx/A93625C9F9ABEA1A8E31585B30BBB16C34FAE0D172EB5B6B2F834AF077BF06BB');
      expect(accUrl,
          'https://explorer.binance.org/address/bnb1u7jm0cll5h3224y0tapwn6gf6pr49ytewx4gsz');
    });
  });
}

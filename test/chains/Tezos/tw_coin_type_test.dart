import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWTezosCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeTezos;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 'onk3Z6V4StyfiXTPSHwZFvTKVAaws37cHmZacmULPr3VbVHpKrg';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'tz1SiPXX4MYGNJNDsRc7n8hkvUqFzg8xqF9m';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'tezos');
      expect(name, 'Tezos');
      expect(symbol, 'XTZ');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainTezos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://tzstats.com/onk3Z6V4StyfiXTPSHwZFvTKVAaws37cHmZacmULPr3VbVHpKrg');
      expect(
          accUrl, 'https://tzstats.com/tz1SiPXX4MYGNJNDsRc7n8hkvUqFzg8xqF9m');
    });
  });
}

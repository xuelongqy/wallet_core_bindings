import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWZenEONCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeZenEON;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xb462e3dac8eef21957d3b6cff3c184d083434367a726dd871e98a774f4d037a5';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x09bCfC348101B1179BCF3837aC996cF09357215f';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'zeneon');
      expect(name, 'Zen EON');
      expect(symbol, 'ZEN');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '7332');
      expect(txUrl,
          'https://eon-explorer.horizenlabs.io/tx/0xb462e3dac8eef21957d3b6cff3c184d083434367a726dd871e98a774f4d037a5');
      expect(accUrl,
          'https://eon-explorer.horizenlabs.io/address/0x09bCfC348101B1179BCF3837aC996cF09357215f');
    });
  });
}

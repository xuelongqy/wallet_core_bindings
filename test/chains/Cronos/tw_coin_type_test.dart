import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWCronosCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeCronosChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x850131282053328ad569fa91200aa970cbed7d97b52951fe8b449cca3708789e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x44eed2bb80b688a8778173c19fe11cd6876af15a';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'cronos');
      expect(name, 'Cronos Chain');
      expect(symbol, 'CRO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://cronoscan.com/tx/0x850131282053328ad569fa91200aa970cbed7d97b52951fe8b449cca3708789e');
      expect(accUrl,
          'https://cronoscan.com/address/0x44eed2bb80b688a8778173c19fe11cd6876af15a');
    });
  });
}
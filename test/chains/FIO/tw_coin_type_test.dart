import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWFIOCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeFIO;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '930d1d3cf8988b39b5f64b64e9d61314a3e05a155d9e3505bdf863aab1adddf3';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'f5axfpgffiqz';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'fio');
      expect(name, 'FIO');
      expect(symbol, 'FIO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainFIO);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.fioprotocol.io/transaction/930d1d3cf8988b39b5f64b64e9d61314a3e05a155d9e3505bdf863aab1adddf3');
      expect(accUrl, 'https://explorer.fioprotocol.io/account/f5axfpgffiqz');
    });
  });
}

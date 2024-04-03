import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWEOSCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeEOS;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'eos');
      expect(name, 'EOS');
      expect(symbol, 'EOS');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 4);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEOS);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl, 'https://bloks.io/transaction/t123');
      expect(accUrl, 'https://bloks.io/account/a12');
    });
  });
}

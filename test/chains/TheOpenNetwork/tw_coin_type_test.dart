import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWTONCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeTON;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 'fJXfn0EVhV09HFuEgUHu4Cchb24nUQtIMwSzmzk2tLs=';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'ton');
      expect(name, 'TON');
      expect(symbol, 'TON');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(
          TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainTheOpenNetwork);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://tonscan.org/tx/fJXfn0EVhV09HFuEgUHu4Cchb24nUQtIMwSzmzk2tLs=');
      expect(accUrl,
          'https://tonscan.org/address/EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N');
    });
  });
}

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWWAXCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeWAX;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '4548f7b28ee608663caea61234049ac0018415e02dd0abcea1c215c8da00d10a';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'k52o1qdeh.gm';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'wax');
      expect(name, 'WAX');
      expect(symbol, 'WAXP');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 4);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEOS);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://wax.bloks.io/transaction/4548f7b28ee608663caea61234049ac0018415e02dd0abcea1c215c8da00d10a');
      expect(accUrl, 'https://wax.bloks.io/account/k52o1qdeh.gm');
    });
  });
}
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWZelcashCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeZelcash;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'zelcash');
      expect(name, 'Flux');
      expect(symbol, 'FLUX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainZcash);
      expect(TWCoinTypeP2shPrefix(coin), 0xbd);
      expect(TWCoinTypeStaticPrefix(coin), 0x1c);
      expect(txUrl, 'https://explorer.runonflux.io/tx/t123');
      expect(accUrl, 'https://explorer.runonflux.io/address/a12');
    });
  });
}

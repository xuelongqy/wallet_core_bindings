import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWPivxCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypePivx;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);

      expect(id, 'pivx');
      expect(name, 'Pivx');
      expect(symbol, 'PIVX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 13);
      expect(TWCoinTypeP2pkhPrefix(coin), 30);
    });
  });
}

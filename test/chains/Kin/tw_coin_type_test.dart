import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWKinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeKin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'kin');
      expect(name, 'Kin');
      expect(symbol, 'KIN');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 5);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainStellar);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://www.kin.org/blockchainInfoPage/?&dataType=public&header=Transaction&id=t123');
      expect(accUrl,
          'https://www.kin.org/blockchainAccount/?&dataType=public&header=accountID&id=a12');
    });
  });
}

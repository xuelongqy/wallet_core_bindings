import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWMoonbeamCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeMoonbeam;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xb22a146c933e6e51affbfa5f712a266b5f5e92ae453cd2f252bcc3c36ff035a6';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x201bb4f276C765dF7225e5A4153E17edD23a67eC';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'moonbeam');
      expect(name, 'Moonbeam');
      expect(symbol, 'GLMR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '1284');
      expect(txUrl,
          'https://moonscan.io/tx/0xb22a146c933e6e51affbfa5f712a266b5f5e92ae453cd2f252bcc3c36ff035a6');
      expect(accUrl,
          'https://moonscan.io/address/0x201bb4f276C765dF7225e5A4153E17edD23a67eC');
    });
  });
}

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWCeloCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeCelo;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xaf41ee58afe633dc7b179c15693cca40fe0372c1d7c70351620105d59d326693';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xFBFf95e2Fa7e4Ff3aeA34eFB05fB60F9968a6aaD';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'celo');
      expect(name, 'Celo');
      expect(symbol, 'CELO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.celo.org/tx/0xaf41ee58afe633dc7b179c15693cca40fe0372c1d7c70351620105d59d326693');
      expect(accUrl,
          'https://explorer.celo.org/address/0xFBFf95e2Fa7e4Ff3aeA34eFB05fB60F9968a6aaD');
    });
  });
}

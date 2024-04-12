import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWGreenfieldCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeGreenfield;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x150eac42070957115fd538b1f348fadd78d710fb641c248120efcf35d1e7e4f3';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xcf0f6b88ed72653b00fdebbffc90b98072cb3285';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'greenfield');
      expect(name, 'BNB Greenfield');
      expect(symbol, 'BNB');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainGreenfield);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '1017');
      expect(txUrl,
          'https://greenfieldscan.com/tx/0x150eac42070957115fd538b1f348fadd78d710fb641c248120efcf35d1e7e4f3');
      expect(accUrl,
          'https://greenfieldscan.com/account/0xcf0f6b88ed72653b00fdebbffc90b98072cb3285');
    });
  });
}

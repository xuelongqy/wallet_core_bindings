import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWThetaFuelCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeThetaFuel;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xdb1c1c4e06289a4fc71b98ced218242d4f4a54a09987791a6a53a5260c053555';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xa144e6a98b967e585b214bfa7f6692af81987e5b';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'tfuelevm');
      expect(name, 'Theta Fuel');
      expect(symbol, 'TFUEL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '361');
      expect(txUrl,
          'https://explorer.thetatoken.org/tx/0xdb1c1c4e06289a4fc71b98ced218242d4f4a54a09987791a6a53a5260c053555');
      expect(accUrl,
          'https://explorer.thetatoken.org/account/0xa144e6a98b967e585b214bfa7f6692af81987e5b');
    });
  });
}

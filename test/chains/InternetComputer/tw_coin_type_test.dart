import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWInternetComputerCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeInternetComputer;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '9e32c54975adf84a1d98f19df41bbc34a752a899c32cc9c0000200b2c4308f85';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          '529ea51c22e8d66e8302eabd9297b100fdb369109822248bb86939a671fbc55b';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'internet_computer');
      expect(name, 'Internet Computer');
      expect(symbol, 'ICP');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin),
          TWBlockchain.TWBlockchainInternetComputer);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://dashboard.internetcomputer.org/transaction/9e32c54975adf84a1d98f19df41bbc34a752a899c32cc9c0000200b2c4308f85');
      expect(accUrl,
          'https://dashboard.internetcomputer.org/account/529ea51c22e8d66e8302eabd9297b100fdb369109822248bb86939a671fbc55b');
    });
  });
}
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWRoninCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeRonin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xc09835aaf9c1cacea8ce322865583c791d3a4dfbd9a3b72f79539db88d3697ab';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xdc05ecd5fbdb64058d94f3182d66f44342b9adcb';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'ronin');
      expect(name, 'Ronin');
      expect(symbol, 'RON');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainRonin);
      expect(txUrl,
          'https://explorer.roninchain.com/tx/0xc09835aaf9c1cacea8ce322865583c791d3a4dfbd9a3b72f79539db88d3697ab');
      expect(accUrl,
          'https://explorer.roninchain.com/address/0xdc05ecd5fbdb64058d94f3182d66f44342b9adcb');
    });
  });
}

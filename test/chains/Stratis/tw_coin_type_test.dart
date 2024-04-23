import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWStratisCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeStratis;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '3923df87e83859dec8b87a414cbb1529113788c512a4d0c283e1394c274f0bfb';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'XWqnSWzQA5kDAS727UTYtXkdcbKc8mEvyN';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'stratis');
      expect(name, 'Stratis');
      expect(symbol, 'STRAX');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBitcoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x8c);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://explorer.rutanio.com/strax/explorer/transaction/3923df87e83859dec8b87a414cbb1529113788c512a4d0c283e1394c274f0bfb');
      expect(accUrl,
          'https://explorer.rutanio.com/strax/explorer/address/XWqnSWzQA5kDAS727UTYtXkdcbKc8mEvyN');
    });
  });
}

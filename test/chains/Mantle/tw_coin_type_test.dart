import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWMantleCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeMantle;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xfae996ea23f1ff9909ac04d26ae6e52ab600a84163fab9e0e893483c685629dd';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xA295EEFd401C8BE1457F266d3e73cdD015e5CFbb';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'mantle');
      expect(name, 'Mantle');
      expect(symbol, 'MNT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '5000');
      expect(txUrl,
          'https://explorer.mantle.xyz/tx/0xfae996ea23f1ff9909ac04d26ae6e52ab600a84163fab9e0e893483c685629dd');
      expect(accUrl,
          'https://explorer.mantle.xyz/address/0xA295EEFd401C8BE1457F266d3e73cdD015e5CFbb');
    });
  });
}

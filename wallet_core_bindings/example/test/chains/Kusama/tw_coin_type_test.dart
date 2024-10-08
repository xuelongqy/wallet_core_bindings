import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWKusamaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Kusama;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xcbe0c2e2851c1245bedaae4d52f06eaa6b4784b786bea2f0bff11af7715973dd';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'DbCNECPna3k6MXFWWNZa5jGsuWycqEE6zcUxZYkxhVofrFk';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'kusama');
      expect(name, 'Kusama');
      expect(symbol, 'KSM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 12);
      expect(coin.blockchain, TWBlockchain.Kusama);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://kusama.subscan.io/extrinsic/0xcbe0c2e2851c1245bedaae4d52f06eaa6b4784b786bea2f0bff11af7715973dd');
      expect(accUrl,
          'https://kusama.subscan.io/account/DbCNECPna3k6MXFWWNZa5jGsuWycqEE6zcUxZYkxhVofrFk');
    });
  });
}

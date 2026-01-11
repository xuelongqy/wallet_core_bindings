import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWAcalaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Acala;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xf3d58aafb1208bc09d10ba74bbf1c7811dc55a9149c1505256b6fb5603f5047f';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '26JqMKx4HJJcmb1kXo24HYYobiK2jURGCq6zuEzFBK3hQ9Ti';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'acala');
      expect(name, 'Acala');
      expect(symbol, 'ACA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 12);
      expect(coin.blockchain, TWBlockchain.Polkadot);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://acala.subscan.io/extrinsic/0xf3d58aafb1208bc09d10ba74bbf1c7811dc55a9149c1505256b6fb5603f5047f');
      expect(accUrl,
          'https://acala.subscan.io/account/26JqMKx4HJJcmb1kXo24HYYobiK2jURGCq6zuEzFBK3hQ9Ti');
    });
  });
}

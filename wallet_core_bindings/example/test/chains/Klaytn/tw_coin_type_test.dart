import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWKlaytnCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Kaia;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final chainId = coin.chainId;
      const txId =
          '0x93ea92687845fe7bb6cacd69c76a16a2a3c2bbb85a8a93ff0e032d0098d583d7';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x2ad9656bf5b82caf10847b431012e28e301e83ba';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'kaia');
      expect(name, 'Kaia');
      expect(symbol, 'KAIA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '8217');
      expect(txUrl,
          'https://kaiascan.io/tx/0x93ea92687845fe7bb6cacd69c76a16a2a3c2bbb85a8a93ff0e032d0098d583d7');
      expect(accUrl,
          'https://kaiascan.io/account/0x2ad9656bf5b82caf10847b431012e28e301e83ba');
    });
  });
}

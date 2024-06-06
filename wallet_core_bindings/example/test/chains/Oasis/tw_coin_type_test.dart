import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWOasisCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Oasis;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '73dc977fdd8596d4a57e6feb891b21f5da3652d26815dc94f15f7420c298e29e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'oasis1qrx376dmwuckmruzn9vq64n49clw72lywctvxdf4';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'oasis');
      expect(name, 'Oasis');
      expect(symbol, 'ROSE');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(coin.blockchain, TWBlockchain.OasisNetwork);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://oasisscan.com/transactions/73dc977fdd8596d4a57e6feb891b21f5da3652d26815dc94f15f7420c298e29e');
      expect(accUrl,
          'https://oasisscan.com/accounts/detail/oasis1qrx376dmwuckmruzn9vq64n49clw72lywctvxdf4');
    });
  });
}

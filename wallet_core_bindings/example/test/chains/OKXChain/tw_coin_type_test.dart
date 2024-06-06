import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWCoinTypeOKXChain', () {
    test('TWCoinType', () {
      const coin = TWCoinType.OKXChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x46C3A947E8248570FBD28E4FE456CC8F80DFD90716533878FB67857B95FA3D37';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x074faafd0b20fad2efa115b8ed7e75993e580b85';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'okc');
      expect(name, 'OKX Chain');
      expect(symbol, 'OKT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://www.oklink.com/oktc/tx/0x46C3A947E8248570FBD28E4FE456CC8F80DFD90716533878FB67857B95FA3D37');
      expect(accUrl,
          'https://www.oklink.com/oktc/address/0x074faafd0b20fad2efa115b8ed7e75993e580b85');
    });
  });
}

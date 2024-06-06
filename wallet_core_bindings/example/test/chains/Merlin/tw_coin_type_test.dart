import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMerlinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Merlin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xca6f2891959b669237738dd0bc2c1051d966778c9de90b94165032ce58364212';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xf7e017b3f61bD3410A3b03D7DAD7699FD6780584';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'merlin');
      expect(name, 'Merlin');
      expect(symbol, 'BTC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://scan.merlinchain.io/tx/0xca6f2891959b669237738dd0bc2c1051d966778c9de90b94165032ce58364212');
      expect(accUrl,
          'https://scan.merlinchain.io/address/0xf7e017b3f61bD3410A3b03D7DAD7699FD6780584');
    });
  });
}

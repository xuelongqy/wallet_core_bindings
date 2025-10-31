import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMonadCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Monad;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xfffe6b1c1238be8d5f4779f97af8fffc89530e2634c61be7a5241dc08f41f07f';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xa161C1d86b26ac692604E0cDbc5EcB2D1d85759c';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'monad');
      expect(name, 'Monad Testnet');
      expect(symbol, 'MON');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://testnet.monadexplorer.com/tx/0xfffe6b1c1238be8d5f4779f97af8fffc89530e2634c61be7a5241dc08f41f07f');
      expect(accUrl,
          'https://testnet.monadexplorer.com/address/0xa161C1d86b26ac692604E0cDbc5EcB2D1d85759c');
    });
  });
}

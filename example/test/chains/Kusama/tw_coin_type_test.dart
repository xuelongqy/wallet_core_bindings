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
      final nativeTokenName = TWCoinTypeConfiguration.getNativeTokenName(coin);
      const txId =
          '0x834220074151531626b34acf4568cd5763a47b2eb2647bd0f0b7e46f980e0c50';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'FfnS7Vk2i19AdFMf6D8ZRVUhNsYWVtsLmqQEnAmTqQBqsSy';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'kusama');
      expect(name, 'Kusama');
      expect(nativeTokenName, 'Kusama');
      expect(symbol, 'KSM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 12);
      expect(coin.blockchain, TWBlockchain.Kusama);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://assethub-kusama.subscan.io/extrinsic/0x834220074151531626b34acf4568cd5763a47b2eb2647bd0f0b7e46f980e0c50');
      expect(accUrl,
          'https://assethub-kusama.subscan.io/account/FfnS7Vk2i19AdFMf6D8ZRVUhNsYWVtsLmqQEnAmTqQBqsSy');
    });
  });
}

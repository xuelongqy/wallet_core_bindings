import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNEOCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.NEO;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'e0ddf7c81c732df26180aca0c36d5868ad009fdbbe6e7a56ebafc14bba41cd53';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'AcxuqWhTureEQGeJgbmtSWNAtssjMLU7pb';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'neo');
      expect(name, 'NEO');
      expect(symbol, 'NEO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, TWBlockchain.NEO);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://neoscan.io/transaction/e0ddf7c81c732df26180aca0c36d5868ad009fdbbe6e7a56ebafc14bba41cd53');
      expect(accUrl,
          'https://neoscan.io/address/AcxuqWhTureEQGeJgbmtSWNAtssjMLU7pb');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWAxelarCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Axelar;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '838F31D023B273E6A8282085202A4CCEDE1693D2503ACCD557B37C9DAB33A79C';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'axelar1mry47pkga5tdswtluy0m8teslpalkdq060xxh5';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'axelar');
      expect(name, 'Axelar');
      expect(symbol, 'AXL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "axelar-dojo-1");
      expect(txUrl,
          'https://www.mintscan.io/axelar/txs/838F31D023B273E6A8282085202A4CCEDE1693D2503ACCD557B37C9DAB33A79C');
      expect(accUrl,
          'https://www.mintscan.io/axelar/account/axelar1mry47pkga5tdswtluy0m8teslpalkdq060xxh5');
    });
  });
}

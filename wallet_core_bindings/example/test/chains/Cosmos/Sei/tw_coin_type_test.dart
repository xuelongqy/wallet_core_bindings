import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWSeiCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Sei;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '4A2114EE45317439690F3BEA9C8B6CFA11D42CF978F9487754902D372EEB488C';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'sei155hqv2rsypqzq0zpjn72frsxx4l6tcmplw63m2';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'sei');
      expect(name, 'Sei');
      expect(symbol, 'SEI');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "pacific-1");
      expect(txUrl,
          'https://www.mintscan.io/sei/txs/4A2114EE45317439690F3BEA9C8B6CFA11D42CF978F9487754902D372EEB488C');
      expect(accUrl,
          'https://www.mintscan.io/sei/account/sei155hqv2rsypqzq0zpjn72frsxx4l6tcmplw63m2');
    });
  });
}

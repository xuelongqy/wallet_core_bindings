import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWOntologyCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Ontology;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = 't123';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'a12';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'ontology');
      expect(name, 'Ontology');
      expect(symbol, 'ONT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 0);
      expect(coin.blockchain, TWBlockchain.Ontology);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl, 'https://explorer.ont.io/transaction/t123');
      expect(accUrl, 'https://explorer.ont.io/address/a12');
    });
  });
}

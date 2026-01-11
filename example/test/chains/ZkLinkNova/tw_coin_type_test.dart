import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZkLinkNovaCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.ZkLinkNova;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xeb5eb8710369c89115a83f3e744c15c9d388030cfce2fd3a653dbd18f2947400';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xF95115BaD9a4585B3C5e2bfB50579f17163A45aA';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'zklinknova');
      expect(name, 'zkLink Nova Mainnet');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2pkhPrefix, 0x0);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://explorer.zklink.io/tx/0xeb5eb8710369c89115a83f3e744c15c9d388030cfce2fd3a653dbd18f2947400');
      expect(accUrl,
          'https://explorer.zklink.io/address/0xF95115BaD9a4585B3C5e2bfB50579f17163A45aA');
    });
  });
}

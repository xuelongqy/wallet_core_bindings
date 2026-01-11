import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWHECOCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.ECOChain;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x2e62832615f5b68b3bbcd72046a24260ce47052841c1679841b9c574d3959f13';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xc5a5b3e49e5d06afe163553c942dc59b4e358cf1';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'heco');
      expect(name, 'Huobi ECO Chain');
      expect(symbol, 'HT');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(txUrl,
          'https://hecoinfo.com/tx/0x2e62832615f5b68b3bbcd72046a24260ce47052841c1679841b9c574d3959f13');
      expect(accUrl,
          'https://hecoinfo.com/address/0xc5a5b3e49e5d06afe163553c942dc59b4e358cf1');
    });
  });
}

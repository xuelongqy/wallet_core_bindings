import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNanoCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Nano;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'C264DB7BF40738F0CEFF19B606746CB925B713E4B8699A055699E0DC8ABBC70F';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          'nano_1wpj616kwhe1y38y1mspd8aub8i334cwybqco511iyuxm55zx8d67ptf1tsf';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'nano');
      expect(name, 'Nano');
      expect(symbol, 'XNO');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 30);
      expect(coin.blockchain, TWBlockchain.Nano);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://www.nanolooker.com/block/C264DB7BF40738F0CEFF19B606746CB925B713E4B8699A055699E0DC8ABBC70F');
      expect(accUrl,
          'https://www.nanolooker.com/account/nano_1wpj616kwhe1y38y1mspd8aub8i334cwybqco511iyuxm55zx8d67ptf1tsf');
    });
  });
}

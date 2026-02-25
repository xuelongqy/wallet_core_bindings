import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWMegaETHCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.MegaETH;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x9021590996bda7682485fff4ab1ed221cea2fa0b352073f69e5a76114c7ed81a';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x6a4D1b2fC6a894928979F152A8c9245D96860604';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'megaeth');
      expect(name, 'MegaETH');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://megaeth.blockscout.com/tx/0x9021590996bda7682485fff4ab1ed221cea2fa0b352073f69e5a76114c7ed81a');
      expect(accUrl,
          'https://megaeth.blockscout.com/address/0x6a4D1b2fC6a894928979F152A8c9245D96860604');
    });
  });
}

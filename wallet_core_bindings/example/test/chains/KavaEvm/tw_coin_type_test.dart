import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWKavaEvmCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.KavaEvm;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final chainId = coin.chainId;
      const txId =
          '0xa999bd5183568ba178795e6a9d1561566fbf4a9ccc813cc475168832bc4909b3';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xF92d3DB0d9f912f285b1ec69578A6201A78487d7';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'kavaevm');
      expect(name, 'KavaEvm');
      expect(symbol, 'KAVA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '2222');
      expect(txUrl,
          'https://explorer.kava.io/tx/0xa999bd5183568ba178795e6a9d1561566fbf4a9ccc813cc475168832bc4909b3');
      expect(accUrl,
          'https://explorer.kava.io/address/0xF92d3DB0d9f912f285b1ec69578A6201A78487d7');
    });
  });
}

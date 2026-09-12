import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();

  group('TWArcCoinType', () {
    const coin = TWCoinType.Arc;

    test('TWCoinType', () {
      expect(TWCoinTypeConfiguration.getID(coin), 'arc');
      expect(TWCoinTypeConfiguration.getName(coin), 'Arc');
      expect(TWCoinTypeConfiguration.getNativeTokenName(coin), 'USDC');
      expect(TWCoinTypeConfiguration.getSymbol(coin), 'USDC');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2pkhPrefix, 0);
      expect(coin.p2shPrefix, 0);
      expect(coin.staticPrefix, 0);
      expect(
        TWCoinTypeConfiguration.getTransactionURL(coin, ''),
        'https://explorer.arc.io/tx/',
      );
      expect(
        TWCoinTypeConfiguration.getAccountURL(coin, ''),
        'https://explorer.arc.io/address/',
      );
    });

    test('DeriveAddress', () {
      final privateKey = TWPrivateKey.createWithHexString(
        List.filled(32, '46').join(),
      );

      expect(
        coin.deriveAddress(privateKey),
        '0x9d8A62f656a8d1615C1294fd71e9CFb3E4855A4F',
      );
    });
  });
}

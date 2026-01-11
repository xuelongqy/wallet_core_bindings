import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWSuiCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Sui;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId = '68wBKsZyYXmCUydDmabQ71kTcFWTfDG7tFmTLk1HgNdN';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          '0x54e80d76d790c277f5a44f3ce92f53d26f5894892bf395dee6375988876be6b2';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'sui');
      expect(name, 'Sui');
      expect(symbol, 'SUI');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 9);
      expect(coin.blockchain, TWBlockchain.Sui);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://suiscan.xyz/mainnet/tx/68wBKsZyYXmCUydDmabQ71kTcFWTfDG7tFmTLk1HgNdN');
      expect(accUrl,
          'https://suiscan.xyz/mainnet/account/0x54e80d76d790c277f5a44f3ce92f53d26f5894892bf395dee6375988876be6b2');
    });
  });
}

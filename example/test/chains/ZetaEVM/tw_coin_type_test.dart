import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWZetaEVMCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.ZetaEVM;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x04cb1201857de29af97b755e51c888454fb96c1f3bb3c1329bb94d5353d5c19e';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x85539A58F9c88DdDccBaBBfc660968323Fd1e167';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'zetaevm');
      expect(name, 'Zeta EVM');
      expect(symbol, 'ZETA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '7000');
      expect(txUrl,
          'https://explorer.zetachain.com/evm/tx/0x04cb1201857de29af97b755e51c888454fb96c1f3bb3c1329bb94d5353d5c19e');
      expect(accUrl,
          'https://explorer.zetachain.com/address/0x85539A58F9c88DdDccBaBBfc660968323Fd1e167');
    });
  });
}

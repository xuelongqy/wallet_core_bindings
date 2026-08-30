import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWHyperEVMCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.HyperEVM;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final nativeTokenName = TWCoinTypeConfiguration.getNativeTokenName(coin);
      const txId =
          '0xc79cb0bcc08995ac78f74f4a62bfd721d50a7368979b8025f3f8c229bb5a334c';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x3c43014aedbb496e173059f94bfe3b0ed1d55ba0';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'hyperevm');
      expect(name, 'HyperEVM');
      expect(nativeTokenName, 'Hyperliquid');
      expect(symbol, 'HYPE');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://hyperevmscan.io/tx/0xc79cb0bcc08995ac78f74f4a62bfd721d50a7368979b8025f3f8c229bb5a334c');
      expect(accUrl,
          'https://hyperevmscan.io/address/0x3c43014aedbb496e173059f94bfe3b0ed1d55ba0');
    });
  });
}

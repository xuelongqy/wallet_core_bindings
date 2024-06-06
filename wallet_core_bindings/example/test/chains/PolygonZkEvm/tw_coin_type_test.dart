import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWPolygonZkEVMCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.PolygonzkEVM;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xc70fd1a45b3130f5515a27d96f01a7f508099fb0b8af52ef432d5e4b2373dccd';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x81d98c8fda0410ee3e9d7586cb949cd19fa4cf38';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'polygonzkevm');
      expect(name, 'Polygon zkEVM');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, '1101');
      expect(txUrl,
          'https://zkevm.polygonscan.com/tx/0xc70fd1a45b3130f5515a27d96f01a7f508099fb0b8af52ef432d5e4b2373dccd');
      expect(accUrl,
          'https://zkevm.polygonscan.com/address/0x81d98c8fda0410ee3e9d7586cb949cd19fa4cf38');
    });
  });
}

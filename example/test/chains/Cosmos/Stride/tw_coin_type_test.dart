import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../../utils.dart';

void main() {
  initTest();
  group('TWStrideCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Stride;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'FB67755B3A00D4BCC11F607867B9C767CF24BCB749C718579D1EC794226087C8';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'stride1c44mngg9pjjeqrr07sle7ntuggrajnt4lsf9jl';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'stride');
      expect(name, 'Stride');
      expect(symbol, 'STRD');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "stride-1");
      expect(txUrl,
          'https://www.mintscan.io/stride/txs/FB67755B3A00D4BCC11F607867B9C767CF24BCB749C718579D1EC794226087C8');
      expect(accUrl,
          'https://www.mintscan.io/stride/account/stride1c44mngg9pjjeqrr07sle7ntuggrajnt4lsf9jl');
    });
  });
}

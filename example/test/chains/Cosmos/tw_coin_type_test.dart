import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWCosmosCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.Cosmos;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '541FA06FB37AC1BF61922143783DD76FECA361830F9876D0342536EE8A87A790';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'cosmos1gu6y2a0ffteesyeyeesk23082c6998xyzmt9mz';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'cosmos');
      expect(name, 'Cosmos Hub');
      expect(symbol, 'ATOM');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(coin.blockchain, TWBlockchain.Cosmos);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(chainId, "cosmoshub-4");
      expect(txUrl,
          'https://mintscan.io/cosmos/txs/541FA06FB37AC1BF61922143783DD76FECA361830F9876D0342536EE8A87A790');
      expect(accUrl,
          'https://mintscan.io/cosmos/account/cosmos1gu6y2a0ffteesyeyeesk23082c6998xyzmt9mz');
    });
  });
}

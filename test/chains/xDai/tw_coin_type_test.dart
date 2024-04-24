import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWxDaiCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeXDai;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x936798a1ef607c9e856d7861b15999c770c06f0887c4fc1f6acbf3bef09899c1';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x12d61a95CF55e18D267C2F1AA67d8e42ae1368f8';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'xdai');
      expect(name, 'Gnosis Chain');
      expect(symbol, 'xDAI');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://blockscout.com/xdai/mainnet/tx/0x936798a1ef607c9e856d7861b15999c770c06f0887c4fc1f6acbf3bef09899c1');
      expect(accUrl,
          'https://blockscout.com/xdai/mainnet/address/0x12d61a95CF55e18D267C2F1AA67d8e42ae1368f8');
    });
  });
}

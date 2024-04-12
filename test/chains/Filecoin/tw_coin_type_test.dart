import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWFilecoinCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeFilecoin;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'bafy2bzacedsgjcd6xfhrrymmfrqubb44otlyhvgqkgsh533d5j5hwniiqespm';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'f1abjxfbp274xpdqcpuaykwkfb43omjotacm2p3za';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'filecoin');
      expect(name, 'Filecoin');
      expect(symbol, 'FIL');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainFilecoin);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://filfox.info/en/message/bafy2bzacedsgjcd6xfhrrymmfrqubb44otlyhvgqkgsh533d5j5hwniiqespm');
      expect(accUrl,
          'https://filfox.info/en/address/f1abjxfbp274xpdqcpuaykwkfb43omjotacm2p3za');
    });
  });
}

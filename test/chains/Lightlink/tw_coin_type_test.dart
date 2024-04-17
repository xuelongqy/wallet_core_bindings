import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWLightlinkCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeLightlink;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0xc65f82445aefc883fd4ffe09149c8ce48f61b670c0734528a49d4a8bd8309bb0';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x4566ED6c7a7fFc90E2C7cfF7eB9156262afD2fDe';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'lightlink');
      expect(name, 'Lightlink Phoenix');
      expect(symbol, 'ETH');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(txUrl,
          'https://phoenix.lightlink.io/tx/0xc65f82445aefc883fd4ffe09149c8ce48f61b670c0734528a49d4a8bd8309bb0');
      expect(accUrl,
          'https://phoenix.lightlink.io/address/0x4566ED6c7a7fFc90E2C7cfF7eB9156262afD2fDe');
    });
  });
}

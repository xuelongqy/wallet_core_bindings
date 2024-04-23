import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWTBinanceCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeTBinance;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '92E9DA1B6D603667E2DE83C0AC0C1D9E6D65405AD642DA794421C64A82A078D0';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'tbnb1c2cxgv3cklswxlvqr9anm6mlp6536qnd36txgr';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'tbinance');
      expect(name, 'TBNB');
      expect(symbol, 'BNB');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 8);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainBinance);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://testnet-explorer.binance.org/tx/92E9DA1B6D603667E2DE83C0AC0C1D9E6D65405AD642DA794421C64A82A078D0');
      expect(accUrl,
          'https://testnet-explorer.binance.org/address/tbnb1c2cxgv3cklswxlvqr9anm6mlp6536qnd36txgr');
    });
  });
}

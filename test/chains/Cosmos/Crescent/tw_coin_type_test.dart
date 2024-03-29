import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWCrescentCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeCrescent;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0C46F4B65706FB5A1FB3A7C32543CF7836DA33EB88295573F66F1886A264E852';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = 'cre1ekj60f38vatr9fxy4p2t04mwedpc3mc6v38d6n';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'crescent');
      expect(name, 'Crescent');
      expect(symbol, 'CRE');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCosmos);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, "crescent-1");
      expect(txUrl,
          'https://www.mintscan.io/crescent/txs/0C46F4B65706FB5A1FB3A7C32543CF7836DA33EB88295573F66F1886A264E852');
      expect(accUrl,
          'https://www.mintscan.io/crescent/account/cre1ekj60f38vatr9fxy4p2t04mwedpc3mc6v38d6n');
    });
  });
}

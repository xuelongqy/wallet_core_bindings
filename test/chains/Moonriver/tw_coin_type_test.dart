import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWMoonriverCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeMoonriver;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x2e2daa3943ba65d9bbb910a4f6765aa6a466a0ef8935090547ca9d30e201e032';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x899831D937937d011305E73EE782cce0455DF15a';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = TWCoinTypeChainId(coin);

      expect(id, 'moonriver');
      expect(name, 'Moonriver');
      expect(symbol, 'MOVR');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainEthereum);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(chainId, '1285');
      expect(txUrl,
          'https://moonriver.moonscan.io/tx/0x2e2daa3943ba65d9bbb910a4f6765aa6a466a0ef8935090547ca9d30e201e032');
      expect(accUrl,
          'https://moonriver.moonscan.io/address/0x899831D937937d011305E73EE782cce0455DF15a');
    });
  });
}

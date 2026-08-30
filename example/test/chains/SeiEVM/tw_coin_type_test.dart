import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWSeiEVMCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.SeiEVM;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      final nativeTokenName = TWCoinTypeConfiguration.getNativeTokenName(coin);
      const txId =
          '0xe59dddcf9a93551399780d907eeee52fdbc44ead6406012368470d47979b7362';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0xc5c8d37a73d96a925f770b5481f719df8d1a1b9e';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'seievm');
      expect(name, 'Sei EVM');
      expect(nativeTokenName, 'Sei');
      expect(symbol, 'SEI');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(coin.p2pkhPrefix, 0x0);
      expect(txUrl,
          'https://seiscan.io/tx/0xe59dddcf9a93551399780d907eeee52fdbc44ead6406012368470d47979b7362');
      expect(accUrl,
          'https://seiscan.io/address/0xc5c8d37a73d96a925f770b5481f719df8d1a1b9e');
    });
  });
}

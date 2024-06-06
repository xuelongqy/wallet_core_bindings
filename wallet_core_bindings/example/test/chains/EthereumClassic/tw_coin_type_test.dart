import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWEthereumClassicCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.EthereumClassic;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          '0x66004165d3901819dc22e568931591d2e4287bda54995f4ce2701a12016f5997';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId = '0x9eab4b0fc468a7f5d46228bf5a76cb52370d068d';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'classic');
      expect(name, 'Ethereum Classic');
      expect(symbol, 'ETC');
      expect(chainId, '61');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, TWBlockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://blockscout.com/etc/mainnet/tx/0x66004165d3901819dc22e568931591d2e4287bda54995f4ce2701a12016f5997');
      expect(accUrl,
          'https://blockscout.com/etc/mainnet/address/0x9eab4b0fc468a7f5d46228bf5a76cb52370d068d');
    });
  });
}

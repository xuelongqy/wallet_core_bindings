import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWCardanoCoinType', () {
    test('TWCoinType', () {
      const coin = TWCoinType.TWCoinTypeCardano;
      final symbol = TWCoinTypeConfiguration.getSymbol(coin);
      final id = TWCoinTypeConfiguration.getID(coin);
      final name = TWCoinTypeConfiguration.getName(coin);
      const txId =
          'b7a6c5cadab0f64bdc89c77ee4a351463aba5c33f2cef6bbd6542a74a90a3af3';
      final txUrl = TWCoinTypeConfiguration.getTransactionURL(coin, txId);
      const accId =
          'DdzFFzCqrhstpwKc8WMvPwwBb5oabcTW9zc5ykA37wJR4tYQucvsR9dXb2kEGNXkFJz2PtrpzfRiZkx8R1iNo8NYqdsukVmv7EAybFwC';
      final accUrl = TWCoinTypeConfiguration.getAccountURL(coin, accId);

      expect(id, 'cardano');
      expect(name, 'Cardano');
      expect(symbol, 'ADA');
      expect(TWCoinTypeConfiguration.getDecimals(coin), 6);
      expect(TWCoinTypeBlockchain(coin), TWBlockchain.TWBlockchainCardano);
      expect(TWCoinTypeP2shPrefix(coin), 0x0);
      expect(TWCoinTypeStaticPrefix(coin), 0x0);
      expect(txUrl,
          'https://cardanoscan.io/transaction/b7a6c5cadab0f64bdc89c77ee4a351463aba5c33f2cef6bbd6542a74a90a3af3');
      expect(accUrl,
          'https://cardanoscan.io/address/DdzFFzCqrhstpwKc8WMvPwwBb5oabcTW9zc5ykA37wJR4tYQucvsR9dXb2kEGNXkFJz2PtrpzfRiZkx8R1iNo8NYqdsukVmv7EAybFwC');
    });
  });
}
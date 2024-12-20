import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('Stellar', () {
    const coin = TWCoinType.Stellar;

    test('DeriveAddress', () {
      const words =
          'indicate rival expand cave giant same grocery burden ugly rose tuna blood';

      final wallet = TWHDWallet.createWithMnemonic(words);
      final key = wallet.getKeyForCoin(coin);
      final publicKey = key.getPublicKeyEd25519();

      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressString = address.description;

      expect(addressString,
          'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI');
    });
  });
}

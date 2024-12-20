import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWEverscale', () {
    const coin = TWCoinType.Everscale;

    test('HDWallet', () {
      const mnemonic =
          "shoot island position soft burden budget tooth cruel issue economy destroy above";

      final wallet = TWHDWallet.createWithMnemonic(mnemonic);

      final privateKey = wallet.getKeyForCoin(coin);
      final publicKey = privateKey.getPublicKeyEd25519();
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;

      expect(addressStr,
          '0:0c39661089f86ec5926ea7d4ee4223d634ba4ed6dcc2e80c7b6a8e6d59f79b04');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  const coin = TWCoinType.TON;

  group('TWTheOpenNetwork', () {
    test('Address', () {
      const mnemonic =
          'stuff diamond cycle federal scan spread pigeon people engage teach snack grain';

      final wallet = TWHDWallet.createWithMnemonic(mnemonic);

      final privateKey = wallet.getKey(coin, coin.derivationPath);
      final publicKey = privateKey.getPublicKeyEd25519();
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;

      expect(addressStr, 'EQDYW_1eScJVxtitoBRksvoV9cCYo4uKGWLVNIHB1JqRR3n0');
    });
  });
}

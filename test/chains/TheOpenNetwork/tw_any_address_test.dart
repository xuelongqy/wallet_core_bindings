import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  const coin = TWCoinType.TWCoinTypeTON;

  group('TWTheOpenNetwork', () {
    test('Address', () {
      final mnemonic =
          'stuff diamond cycle federal scan spread pigeon people engage teach snack grain';

      final wallet = TWHDWallet.createWithMnemonic(mnemonic);

      final privateKey = wallet.getKey(coin, TWCoinTypeDerivationPath(coin));
      final publicKey = privateKey.getPublicKeyEd25519();
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;

      expect(addressStr, 'EQDYW_1eScJVxtitoBRksvoV9cCYo4uKGWLVNIHB1JqRR3n0');
    });
  });
}

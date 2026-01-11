import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWAptosAddress', () {
    const coin = TWCoinType.Aptos;

    test('HDWallet', () {
      const mnemonic =
          'shoot island position soft burden budget tooth cruel issue economy destroy above';
      const passphrase = '';

      final wallet =
          TWHDWallet.createWithMnemonic(mnemonic, passphrase: passphrase);

      final privateKey = wallet.getKey(coin, coin.derivationPath);

      final publicKey = privateKey.getPublicKeyEd25519();
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;

      expect(addressStr,
          '0x7968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30');
    });
  });
}

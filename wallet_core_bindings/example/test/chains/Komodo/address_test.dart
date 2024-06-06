import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('KomodoAddress', () {
    const coin = TWCoinType.Komodo;

    test('Valid', () {
      expect(TWAnyAddress.isValid('RXL3YXG2ceaB6C5hfJcN4fvmLH2C34knhA', coin),
          true);
    });

    test('Invalid', () {
      expect(TWAnyAddress.isValid('t1Wg9uPPAfwhBWeRjtDPa5ZHNzyBx9rJVKY', coin),
          false);
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '020e46e79a2a8d12b9b5d12c7a91adb4e454edfae43c0a0cb805427d2ac7613fd9',
        TWPublicKeyType.SECP256k1,
      );
      final address = coin.deriveAddressFromPublicKey(publicKey);
      expect(address, 'RXL3YXG2ceaB6C5hfJcN4fvmLH2C34knhA');

      final wallet = TWHDWallet.createWithMnemonic(
          'shoot island position soft burden budget tooth cruel issue economy destroy above');
      final addr = wallet.getAddressForCoin(coin);
      expect(addr, 'RCWJLXE5CSXydxdSnwcghzPgkFswERegyb');
    });
  });
}

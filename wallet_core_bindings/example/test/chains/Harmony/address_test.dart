import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('HarmonyAddress', () {
    const coin = TWCoinType.Harmony;

    test('FromString', () {
      final sender =
          TWAnyAddress('one1a50tun737ulcvwy0yvve0pvu5skq0kjargvhwe', coin);
      final receiver =
          TWAnyAddress('one1tp7xdd9ewwnmyvws96au0e7e7mz6f8hjqr3g3p', coin);

      expectHex(sender.data, 'ed1ebe4fd1f73f86388f231997859ca42c07da5d');
      expectHex(receiver.data, '587c66b4b973a7b231d02ebbc7e7d9f6c5a49ef2');
    });

    test('InvalidHarmonyAddress', () {
      expect(
        TWAnyAddress.isValid('one1a50tun737ulcvwy0yvve0pe', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'oe1tp7xdd9ewwnmyvws96au0ee7e7mz6f8hjqr3g3p', coin),
        false,
      );
    });

    test('FromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'e2f88b4974ae763ca1c2db49218802c2e441293a09eaa9ab681779e05d1b7b94');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'one1a50tun737ulcvwy0yvve0pvu5skq0kjargvhwe');
    });
  });
}

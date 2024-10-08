import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('EvmosAnyAddress', () {
    const coin = TWCoinType.Evmos;

    test('EvmosValidate', () {
      const string = '0x30627903124Aa1e71384bc52e1cb96E4AB3252b6';

      expect(TWAnyAddress.isValid(string, coin), true);

      final addr = TWAnyAddress(string, coin);

      final keyHash = addr.data;
      expectHex(keyHash, '30627903124aa1e71384bc52e1cb96e4ab3252b6');
    });

    test('EvmosCreate', () {
      const publicKeyHex =
          '045a0c6b83b8bd9827e507270cadb499b7e3a9095246f6a2213281f783d877c98b256742741b0639f317768fe4f4c2762660c2112283a7685d815507dee3229173';
      final publicKey = TWPublicKey.createWithHexString(
          publicKeyHex, TWPublicKeyType.SECP256k1Extended);

      final addr = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(addr.description, '0x8f348F300873Fd5DA36950B2aC75a26584584feE');

      final keyHash = addr.data;
      expectHex(keyHash, '8f348f300873fd5da36950b2ac75a26584584fee');
    });
  });
}

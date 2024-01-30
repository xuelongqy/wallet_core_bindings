import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  group(TWPBKDF2, () {
    test('Sha256_sha512', () {
      final password = TWData.createWithHexString('50617373776f7264').bytes()!;
      final salt = TWData.createWithHexString('4e61436c').bytes()!;

      final sha256Result = TWPBKDF2.hmacSha256(
          password: password, salt: salt, iterations: 80000, dkLen: 128);
      expectHex(sha256Result,
          '4ddcd8f60b98be21830cee5ef22701f9641a4418d04c0414aeff08876b34ab56a1d425a1225833549adb841b51c9b3176a272bdebba1d078478f62b397f33c8d62aae85a11cdde829d89cb6ffd1ab0e63a981f8747d2f2f9fe5874165c83c168d2eed1d2d5ca4052dec2be5715623da019b8c0ec87dc36aa751c38f9893d15c3');

      final sha512Result = TWPBKDF2.hmacSha512(
          password: password, salt: salt, iterations: 80000, dkLen: 128);
      expectHex(sha512Result,
          'e6337d6fbeb645c794d4a9b5b75b7b30dac9ac50376a91df1f4460f6060d5addb2c1fd1f84409abacc67de7eb4056e6bb06c2d82c3ef4ccd1bded0f675ed97c65c33d39f81248454327aa6d03fd049fc5cbb2b5e6dac08e8ace996cdc960b1bd4530b7e754773d75f67a733fdb99baf6470e42ffcb753c15c352d4800fb6f9d6');
    });
  });
}

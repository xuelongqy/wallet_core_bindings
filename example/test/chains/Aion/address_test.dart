import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('AionAddress', () {
    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithData(
        TWData.createWithHexString(
                '01a775daa30b33fda3091768f0561c8042ee23cb48a6a3e5d7e8248b13d04a48a7')
            .bytes()!,
        TWPublicKeyType.ED25519,
      );
      final address =
          TWAnyAddress.createWithPublicKey(publicKey, TWCoinType.Aion);
      expect(address.description,
          '0xa0d2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7');
    });

    test('FromString', () {
      const aionAddress =
          "0xa0d2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7";
      final address = TWAnyAddress(aionAddress, TWCoinType.Aion);
      expect(address.description, aionAddress);
    });

    test('InvalidFromData', () {
      expect(TWAnyAddress('0xffff', TWCoinType.Aion).pointer, 0);
    });

    test('isValid', () {
      const validAddress =
          "0xa0d2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7";
      const invalidAddress =
          "0xzzd2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7";

      expect(TWAnyAddress.isValid(validAddress, TWCoinType.Aion), true);
      expect(TWAnyAddress.isValid(invalidAddress, TWCoinType.Aion), false);
    });
  });
}

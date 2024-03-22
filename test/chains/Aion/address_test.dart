import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('AionAddress', () {
    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithData(
        data: TWData.createWithHexString(
                '01a775daa30b33fda3091768f0561c8042ee23cb48a6a3e5d7e8248b13d04a48a7')
            .bytes()!,
        type: TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(
          publicKey: publicKey, coin: TWCoinType.TWCoinTypeAion);
      expect(address.description,
          '0xa0d2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7');
    });

    test('FromString', () {
      const aionAddress =
          "0xa0d2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7";
      final address = TWAnyAddress(aionAddress, TWCoinType.TWCoinTypeAion);
      expect(address.description, aionAddress);
    });

    test('InvalidFromData', () {
      expect(
          TWAnyAddress('0xffff', TWCoinType.TWCoinTypeAion).pointer, nullptr);
    });

    test('isValid', () {
      final validAddress =
          "0xa0d2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7";
      final invalidAddress =
          "0xzzd2312facea71b740679c926d040c9056a65a4bfa2ddd18ec160064f82909e7";

      expect(
          TWAnyAddress.isValid(validAddress, TWCoinType.TWCoinTypeAion), true);
      expect(TWAnyAddress.isValid(invalidAddress, TWCoinType.TWCoinTypeAion),
          false);
    });
  });
}

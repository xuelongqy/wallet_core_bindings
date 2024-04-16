import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('IoTeXAddress', () {
    const coin = TWCoinType.TWCoinTypeIoTeX;

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('io187wzp08vnhjpkydnr97qlh8kh0dpkkytfam8j', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('it187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('ko187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('io187wzp18vnhjjpkydnr97qlh8kh0dpkkytfam8j', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('io187wzp08vnhjbpkydnr97qlh8kh0dpkkytfam8j', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8k', coin),
        false,
      );
    });

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j', coin),
        true,
      );
    });

    test('FromString', () {
      final address =
          TWAnyAddress('io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j', coin);
      expect(address.description, 'io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j');

      expect(
          TWAnyAddress('io187wzp08vnhjbpkydnr97qlh8kh0dpkkytfam8j', coin)
              .pointer,
          nullptr);
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f');
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j');
    });
  });
}

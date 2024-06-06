import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('VergeAddress', () {
    const coin = TWCoinType.Verge;

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('DRyNFvJaybnF22UfMS6NR1Qav3mqxPj86E', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'vg1qujpe553lzgyg95g7k0w6zwscuy0ae022h4q4zg', coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('DRyNFvJaybnF22UfMS6NR1Qav3mqxPj234', coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '693dfe6f3ed717573eb10c24ebe5eb592fa3c239245cd499c487eb7b8ea7ed3a');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address =
          TWBitcoinAddress.createWithPublicKey(publicKey, coin.p2pkhPrefix);
      expect(address.description, 'DRyNFvJaybnF22UfMS6NR1Qav3mqxPj86E');

      final addr = TWSegwitAddress.createWithPublicKey(coin.hrp, publicKey);
      expect(addr.description, 'vg1qujpe553lzgyg95g7k0w6zwscuy0ae022h4q4zg');
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '034f3eb727ca1eba84a0d22839a483a1120ee6a1da0d5087dde527b5ff912c1694',
        TWPublicKeyType.SECP256k1,
      );
      final address =
          TWBitcoinAddress.createWithPublicKey(publicKey, coin.p2pkhPrefix);
      expect(address.description, 'D8rBdwBfz5wvLhmHvRkXnNzeeihQgxkLmL');
    });

    test('FromString', () {
      final address = TWAnyAddress('DRyNFvJaybnF22UfMS6NR1Qav3mqxPj86E', coin);
      expect(address.description, 'DRyNFvJaybnF22UfMS6NR1Qav3mqxPj86E');

      var data = address.data;
      expect(hex(data), 'e4839a523f120882d11eb3dda13a18e11fdcbd4a');

      data =
          TWAnyAddress('vg1qujpe553lzgyg95g7k0w6zwscuy0ae022h4q4zg', coin).data;
      expect(hex(data), 'e4839a523f120882d11eb3dda13a18e11fdcbd4a');

      // invalid address
      expect(
        TWAnyAddress.isValid('vg1qujpe553lzgyg95g7k0w6zwscuy0ae022h4q4', coin),
        false,
      );
    });
  });
}

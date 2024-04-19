import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('NanoAddress', () {
    const coin = TWCoinType.TWCoinTypeNano;

    test('FromPublicKey', () {
      {
        final publickKey = TWPublicKey.createWithHexString(
          '5114aad86a390897d2a91b33b931b3a59a7df9e63eb3694f9430122f5622ae50',
          TWPublicKeyType.TWPublicKeyTypeED25519Blake2b,
        );
        final address = TWAnyAddress.createWithPublicKey(publickKey, coin);
        expect(
          address.description,
          'nano_1nanode8ngaakzbck8smq6ru9bethqwyehomf79sae1k7xd47dkidjqzffeg',
        );
      }
    });

    test('FromString', () {
      {
        final nanoAddress =
            "nano_1nanode8ngaakzbck8smq6ru9bethqwyehomf79sae1k7xd47dkidjqzffeg";
        final address = TWAnyAddress(nanoAddress, coin);
        expect(address.description, nanoAddress);
        expect(hex(address.data),
            '5114aad86a390897d2a91b33b931b3a59a7df9e63eb3694f9430122f5622ae50');
      }
    });

    test('isValid', () {
      final nanodeAddress =
          "nano_1nanode8ngaakzbck8smq6ru9bethqwyehomf79sae1k7xd47dkidjqzffeg";
      final faultyChecksumAddress =
          "xrb_1111111111111111111111111111111111111111111111111111hi111111";
      final bitcoinAddress = "1Ma2DrB78K7jmAwaomqZNRMCvgQrNjE2QC";

      expect(TWAnyAddress.isValid(nanodeAddress, coin), true);
      expect(TWAnyAddress.isValid(faultyChecksumAddress, coin), false);
      expect(TWAnyAddress.isValid(bitcoinAddress, coin), false);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('SolanaAddress', () {
    const coin = TWCoinType.Solana;

    test('FromPublicKey', () {
      {
        const addressString = "2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST";
        final publicKey = TWPublicKey.createWithData(
          TWBase58.decodeNoCheck(addressString)!,
          TWPublicKeyType.ED25519,
        );
        final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
        expect(addressString, address.description);
      }
      {
        final privateKey = TWPrivateKey.createWithHexString(
            'a1269039e4ffdf43687852d7247a295f0b5bc55e6dda031cffaa3295ca0a9d7a');
        final publicKey = privateKey.getPublicKeySecp256k1(false);
        expect(
          TWAnyAddress.createWithPublicKey(publicKey, coin).description.isEmpty,
          true,
        );
      }
    });

    test('FromData', () {
      {
        final address = TWAnyAddress.createWithPublicKey(
          TWPublicKey.createWithHexString(
            '18f9d8d877393bbbe8d697a8a2e52879cc7e84f467656d1cce6bab5a8d2637ec',
            TWPublicKeyType.ED25519,
          ),
          coin,
        );
        expect(address.description,
            '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST');
      }
    });

    test('FromString', () {
      const addressString = "2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST";
      final address = TWAnyAddress(addressString, coin);
      expect(address.description, addressString);
    });

    test('isValid', () {
      expect(
        TWAnyAddress.isValid(
            '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdSl', coin),
        false,
      ); // Contains invalid base-58 character
      expect(
        TWAnyAddress.isValid(
            '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpd', coin),
        false,
      ); // Is invalid length
    });

    test('isValidOnCurve', () {
      expect(
        TWPublicKey.isValid(
          TWBase58.decodeNoCheck(
              'HzqnaMjWFbK2io6WgV2Z5uBguCBU21RMUS16wsDUHkon')!,
          TWPublicKeyType.ED25519,
        ),
        true,
      );
      expect(
        TWPublicKey.isValid(
          TWBase58.decodeNoCheck(
              '68io7dTfyeWua1wD1YcCMka4y5iiChceaFRCBjqCM5PK')!,
          TWPublicKeyType.ED25519,
        ),
        true,
      );
      expect(
        TWPublicKey.isValid(
          TWBase58.decodeNoCheck(
              'Dra34QLFCjxnk8tUNcBwxs6pgb5spF4oseQYF2xn7ABZ')!,
          TWPublicKeyType.ED25519,
        ),
        true,
      );
      // negative case
      // expect(
      //   TWPublicKey.isValid(
      //     TWBase58.decodeNoCheck(
      //         '6X4X1Ae24mkoWeCEpktevySVG9jzeCufut5vtUW3wFrD')!,
      //     TWPublicKeyType.ED25519,
      //   ),
      //   false,
      // );
      // expect(
      //   TWPublicKey.isValid(
      //     TWBase58.decodeNoCheck(
      //         '6X4X1Ae24mkoWeCEpktevySVG9jzeCufut5vtUW3wFrD')!,
      //     TWPublicKeyType.ED25519,
      //   ),
      //   false,
      // );
      // expect(
      //   TWPublicKey.isValid(
      //     TWBase58.decodeNoCheck(
      //         'ANVCrmRw7Ww7rTFfMbrjApSPXEEcZpBa6YEiBdf98pAf')!,
      //     TWPublicKeyType.ED25519,
      //   ),
      //   false,
      // );
      // expect(
      //   TWPublicKey.isValid(
      //     TWBase58.decodeNoCheck(
      //         'AbygL37RheNZv327cMvZPqKYLLkZ6wqWYexRxgNiZyeP')!,
      //     TWPublicKeyType.ED25519,
      //   ),
      //   false,
      // );
    });
  });
}

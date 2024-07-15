import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  const coin = TWCoinType.TON;

  group('TheOpenNetworkAddress', () {
    test('Valid', () {
      expect(
        TWAnyAddress.isValid(
            '-1:8a8627861a5dd96c9db3ce0807b122da5ed473934ce7568a5b4b1c361cbb28ae',
            coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            '0:8a8627861a5dd96c9db3ce0807b122da5ed473934ce7568a5b4b1c361cbb28ae',
            coin),
        true,
      );

      // user-friendly, b64urlsafe
      expect(
        TWAnyAddress.isValid(
            'EQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorkdl', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'EQBGqFmKe3oY8PChYN9g92ZEV2ybkzVB-hCiesQRn5mFnrNv', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'Ef8JfFPRpHBV_tZpCurvxMJW69nt2js3SuGEWojGnOpCVPRe', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'Ef_drj6m7jcME0fWTA-OwFC-6F0Le2SuOUQ6ibRc3Vz8HL8H', coin),
        true,
      );

      // user-friendly, b64
      expect(
        TWAnyAddress.isValid(
            'EQAN6Dr3vziti1Kp9D3aEFqJX4bBVfCaV57Z+9jwKTBXICv8', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'EQCmGW+z+UL00FmnhWaMvJq/i86YY5GlJP3uJW19KC5Tzq4C', coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('random string', coin),
        false,
      );

      // invalid size
      expect(
        TWAnyAddress.isValid(
            'EQIcIZpPoMnWXd8FbC1KaLtcyIgVUlwsbFK_3P6f5uf_YyzoE', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'EQIcIZpPoMnWXd8FbC1KaLtcyIgVUlwsbFK_3P6f5uf_YyE', coin),
        false,
      );

      // invalid size
      expect(
        TWAnyAddress.isValid(
            'EQIcIZpPoMnWXd8FbC1KaLtcyIgVUlwsbFK_3P6f5uf_Yyw=', coin),
        false,
      );

      // invalid workchain
      expect(
        TWAnyAddress.isValid(
            '1:0ccd5119f27f7fe4614476c34f7e5e93c7ae098e577cf2012f8b8043165cb809',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'EQEMzVEZ8n9_5GFEdsNPfl6Tx64Jjld88gEvi4BDFly4CSyl', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '-2:e0e98cfcf743292298ad9e379a3c2e6401797b9cbfc0fe98b4e14fd0ce07ecdf',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'Ef7g6Yz890MpIpitnjeaPC5kAXl7nL_A_pi04U_Qzgfs3-Cj', coin),
        false,
      );

      // invalid tag
      expect(
        TWAnyAddress.isValid(
            'MwCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorsn8', coin),
        false,
      ); // 0x33
      expect(
        TWAnyAddress.isValid(
            'swCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsornJ2', coin),
        false,
      ); // 0x80 + 0x33

      // invalid crc
      expect(
        TWAnyAddress.isValid(
            'EQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsormVH', coin),
        false,
      ); // crc[a, b] = crc[b, a]
      expect(
        TWAnyAddress.isValid(
            'EQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorpcF', coin),
        false,
      ); // crc=0x9705
    });

    test('GetJettonNotcoinAddress', () {
      const mainAddress = 'UQBjKqthWBE6GEcqb_epTRFrQ1niS6Z1Z1MHMwR-mnAYRoYr';
      final addressBocEncoded = TWTONAddressConverter.toBoc(mainAddress);
      expect(addressBocEncoded,
          'te6ccgICAAEAAQAAACQAAABDgAxlVWwrAidDCOVN/vUpoi1oazxJdM6s6mDmYI/TTgMI0A==');

      // curl --location 'https://toncenter.com/api/v2/runGetMethod' --header 'Content-Type: application/json' --data \
      // '{"address":"EQAvlWFDxGF2lXm67y4yzC17wYKD9A0guwPkMs1gOsM__NOT","method":"get_wallet_address","method":"get_wallet_address","stack":[["tvm.Slice","te6ccgICAAEAAQAAACQAAABDgAxlVWwrAidDCOVN/vUpoi1oazxJdM6s6mDmYI/TTgMI0A=="]]}'

      // `get_wallet_address` response:
      const jettonAddressBocEncoded =
          'te6cckEBAQEAJAAAQ4AFvT5rqwxcbKfITqnkwL+go4Zi9bulRHAtLt4cjjFdK7B8L+Cq';
      final jettonAddress =
          TWTONAddressConverter.fromBoc(jettonAddressBocEncoded);
      expect(jettonAddress, 'UQAt6fNdWGLjZT5CdU8mBf0FHDMXrd0qI4FpdvDkcYrpXV5H');
    });

    test('GetJettonUSDTAddress', () {
      const mainAddress = 'UQBjKqthWBE6GEcqb_epTRFrQ1niS6Z1Z1MHMwR-mnAYRoYr';
      final addressBocEncoded = TWTONAddressConverter.toBoc(mainAddress);
      expect(addressBocEncoded,
          'te6ccgICAAEAAQAAACQAAABDgAxlVWwrAidDCOVN/vUpoi1oazxJdM6s6mDmYI/TTgMI0A==');

      // curl --location 'https://toncenter.com/api/v2/runGetMethod' --header 'Content-Type: application/json' --data \
      // '{"address":"EQCxE6mUtQJKFnGfaROTKOt1lZbDiiX1kCixRv7Nw2Id_sDs","method":"get_wallet_address","method":"get_wallet_address","stack":[["tvm.Slice","te6ccgICAAEAAQAAACQAAABDgAxlVWwrAidDCOVN/vUpoi1oazxJdM6s6mDmYI/TTgMI0A=="]]}'

      // `get_wallet_address` response:
      const jettonAddressBocEncoded =
          'te6cckEBAQEAJAAAQ4Aed71FEI46jdFXghsGUIG2GIR8wpbQaLzrKNj7BtHOEHBSO5Mf';
      final jettonAddress =
          TWTONAddressConverter.fromBoc(jettonAddressBocEncoded);
      expect(jettonAddress, 'UQDzveoohHHUboq8ENgyhA2wxCPmFLaDRedZRsfYNo5wg4TL');
    });

    test('GetJettonStonAddress', () {
      const mainAddress = 'EQATQPeCwtMzQ9u54nTjUNcK4n_0VRSxPOOROLf_IE0OU3XK';
      final addressBocEncoded = TWTONAddressConverter.toBoc(mainAddress);
      expect(addressBocEncoded,
          'te6ccgICAAEAAQAAACQAAABDgAJoHvBYWmZoe3c8TpxqGuFcT/6KopYnnHInFv/kCaHKcA==');

      // curl --location 'https://toncenter.com/api/v2/runGetMethod' --header 'Content-Type: application/json' --data \
      // '{"address":"EQA2kCVNwVsil2EM2mB0SkXytxCqQjS4mttjDpnXmwG9T6bO","method":"get_wallet_address","method":"get_wallet_address","stack":[["tvm.Slice","te6ccgICAAEAAQAAACQAAABDgAxlVWwrAidDCOVN/vUpoi1oazxJdM6s6mDmYI/TTgMI0A=="]]}'

      // `get_wallet_address` response:
      const jettonAddressBocEncoded =
          'te6cckEBAQEAJAAAQ4ALPu0dyA1gHd3r7J1rxlvhXSvT5y3rokMDMiCQ86TsUJDnt69H';
      final jettonAddress =
          TWTONAddressConverter.fromBoc(jettonAddressBocEncoded);
      expect(jettonAddress, 'UQBZ92juQGsA7u9fZOteMt8K6V6fOW9dEhgZkQSHnSdihHPH');
    });

    test('FromBocNullAddress', () {
      const jettonAddressBocEncoded = 'te6cckEBAQEAAwAAASCUQYZV';
      final jettonAddress =
          TWTONAddressConverter.fromBoc(jettonAddressBocEncoded);
      expect(jettonAddress, 'UQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJKZ');
    });

    test('FromBocError', () {
      // No type bit.
      const boc1 = 'te6cckEBAQEAAwAAAcCO6ba2';
      expect(TWTONAddressConverter.fromBoc(boc1), null);

      // No res1 and workchain bits.
      const boc2 = 'te6cckEBAQEAAwAAAaDsenDX';
      expect(TWTONAddressConverter.fromBoc(boc2), null);

      // Incomplete hash (31 bytes instead of 32).
      const boc3 =
          'te6cckEBAQEAIwAAQYAgQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAUGJnJWk=';
      expect(TWTONAddressConverter.fromBoc(boc3), null);

      // Expected 267 bits, found 268.
      const boc4 =
          'te6cckEBAQEAJAAAQ4AgQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEgGG0Gq';
      expect(TWTONAddressConverter.fromBoc(boc4), null);
    });

    test('ToUserFriendly', () {
      const rawAddress =
          "0:8a8627861a5dd96c9db3ce0807b122da5ed473934ce7568a5b4b1c361cbb28ae";
      const bounceable = "EQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorkdl";
      const nonBounceable = "UQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorhqg";
      const bounceableTestnet =
          "kQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorvzv";
      const nonBounceableTestnet =
          "0QCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorqEq";

      // Raw to user friendly.
      expect(
        TWTONAddressConverter.toUserFriendly(rawAddress, true, false),
        bounceable,
      );
      expect(
        TWTONAddressConverter.toUserFriendly(rawAddress, false, false),
        nonBounceable,
      );
      expect(
        TWTONAddressConverter.toUserFriendly(rawAddress, true, true),
        bounceableTestnet,
      );
      expect(
        TWTONAddressConverter.toUserFriendly(rawAddress, false, true),
        nonBounceableTestnet,
      );

      // Bounceable to non-bounceable.
      expect(
        TWTONAddressConverter.toUserFriendly(bounceable, false, false),
        nonBounceable,
      );

      // Non-bounceable to bounceable.
      expect(
        TWTONAddressConverter.toUserFriendly(nonBounceable, true, false),
        bounceable,
      );

      // Non-bounceable to non-bounceable.
      expect(
        TWTONAddressConverter.toUserFriendly(nonBounceable, false, false),
        nonBounceable,
      );
    });

    test('ToUserFriendlyError', () {
      // No "0:" prefix.
      const invalid1 =
          '8a8627861a5dd96c9db3ce0807b122da5ed473934ce7568a5b4b1c361cbb28ae';
      expectWasmWithException(
        () => TWTONAddressConverter.toUserFriendly(invalid1, true, false),
        null,
      );

      // Too short.
      const invalid2 = 'EQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsor';
      expectWasmWithException(
        () => TWTONAddressConverter.toUserFriendly(invalid2, false, false),
        null,
      );
    });
  });
}

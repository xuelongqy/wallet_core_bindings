import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  const coin = TWCoinType.TWCoinTypeTON;

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
  });
}

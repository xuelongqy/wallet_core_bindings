import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWHRP, () {
    test('StringForHRP', () {
      expect(stringForHRP(TWHRP.TWHRPUnknown), null);
      expect(stringForHRP(TWHRP.TWHRPBitcoin), "bc");
      expect(stringForHRP(TWHRP.TWHRPLitecoin), "ltc");
      expect(stringForHRP(TWHRP.TWHRPBitcoinCash), "bitcoincash");
      expect(stringForHRP(TWHRP.TWHRPBinance), "bnb");
      expect(stringForHRP(TWHRP.TWHRPCosmos), "cosmos");
      expect(stringForHRP(TWHRP.TWHRPDigiByte), "dgb");
      expect(stringForHRP(TWHRP.TWHRPGroestlcoin), "grs");
      expect(stringForHRP(TWHRP.TWHRPIoTeX), "io");
      expect(stringForHRP(TWHRP.TWHRPQtum), "qc");
      expect(stringForHRP(TWHRP.TWHRPZilliqa), "zil");
      expect(stringForHRP(TWHRP.TWHRPViacoin), "via");
      expect(stringForHRP(TWHRP.TWHRPTerra), "terra");
      expect(stringForHRP(TWHRP.TWHRPMonacoin), "mona");
      expect(stringForHRP(TWHRP.TWHRPKava), "kava");
      expect(stringForHRP(TWHRP.TWHRPBandChain), "band");
      expect(stringForHRP(TWHRP.TWHRPBluzelle), "bluzelle");
      expect(stringForHRP(TWHRP.TWHRPCardano), "addr");
      expect(stringForHRP(TWHRP.TWHRPMultiversX), "erd");
      expect(stringForHRP(TWHRP.TWHRPOasis), "oasis");
      expect(stringForHRP(TWHRP.TWHRPTHORChain), "thor");
      expect(stringForHRP(TWHRP.TWHRPCryptoOrg), "cro");
      expect(stringForHRP(TWHRP.TWHRPOsmosis), "osmo");
      expect(stringForHRP(TWHRP.TWHRPSecret), "secret");
    });

    test('HRPForString', () {
      expect(hrpForString(""), TWHRP.TWHRPUnknown);
      expect(hrpForString("bc"), TWHRP.TWHRPBitcoin);
      expect(hrpForString("ltc"), TWHRP.TWHRPLitecoin);
      expect(hrpForString("bitcoincash"), TWHRP.TWHRPBitcoinCash);
      expect(hrpForString("bnb"), TWHRP.TWHRPBinance);
      expect(hrpForString("cosmos"), TWHRP.TWHRPCosmos);
      expect(hrpForString("dgb"), TWHRP.TWHRPDigiByte);
      expect(hrpForString("grs"), TWHRP.TWHRPGroestlcoin);
      expect(hrpForString("io"), TWHRP.TWHRPIoTeX);
      expect(hrpForString("qc"), TWHRP.TWHRPQtum);
      expect(hrpForString("zil"), TWHRP.TWHRPZilliqa);
      expect(hrpForString("via"), TWHRP.TWHRPViacoin);
      expect(hrpForString("terra"), TWHRP.TWHRPTerra);
      expect(hrpForString("mona"), TWHRP.TWHRPMonacoin);
      expect(hrpForString("kava"), TWHRP.TWHRPKava);
      expect(hrpForString("band"), TWHRP.TWHRPBandChain);
      expect(hrpForString("addr"), TWHRP.TWHRPCardano);
      expect(hrpForString("erd"), TWHRP.TWHRPMultiversX);
      expect(hrpForString("oasis"), TWHRP.TWHRPOasis);
      expect(hrpForString("thor"), TWHRP.TWHRPTHORChain);
      expect(hrpForString("bluzelle"), TWHRP.TWHRPBluzelle);
      expect(hrpForString("cro"), TWHRP.TWHRPCryptoOrg);
      expect(hrpForString("osmo"), TWHRP.TWHRPOsmosis);
      expect(hrpForString("ecash"), TWHRP.TWHRPECash);
      expect(hrpForString("secret"), TWHRP.TWHRPSecret);
    });

    test('HPRByCoinType', () {
      expect(TWHRP.TWHRPBitcoin, TWCoinTypeHRP(TWCoinType.TWCoinTypeBitcoin));
      expect(TWHRP.TWHRPBitcoinCash,
          TWCoinTypeHRP(TWCoinType.TWCoinTypeBitcoinCash));
      expect(TWHRP.TWHRPBinance, TWCoinTypeHRP(TWCoinType.TWCoinTypeBinance));
      expect(TWHRP.TWHRPCosmos, TWCoinTypeHRP(TWCoinType.TWCoinTypeCosmos));
      expect(TWHRP.TWHRPDigiByte, TWCoinTypeHRP(TWCoinType.TWCoinTypeDigiByte));
      expect(TWHRP.TWHRPLitecoin, TWCoinTypeHRP(TWCoinType.TWCoinTypeLitecoin));
      expect(TWHRP.TWHRPGroestlcoin,
          TWCoinTypeHRP(TWCoinType.TWCoinTypeGroestlcoin));
      expect(TWHRP.TWHRPIoTeX, TWCoinTypeHRP(TWCoinType.TWCoinTypeIoTeX));
      expect(TWHRP.TWHRPViacoin, TWCoinTypeHRP(TWCoinType.TWCoinTypeViacoin));
      expect(TWHRP.TWHRPQtum, TWCoinTypeHRP(TWCoinType.TWCoinTypeQtum));
      expect(TWHRP.TWHRPZilliqa, TWCoinTypeHRP(TWCoinType.TWCoinTypeZilliqa));
      expect(TWHRP.TWHRPTerra, TWCoinTypeHRP(TWCoinType.TWCoinTypeTerra));
      expect(TWHRP.TWHRPMonacoin, TWCoinTypeHRP(TWCoinType.TWCoinTypeMonacoin));
      expect(TWHRP.TWHRPKava, TWCoinTypeHRP(TWCoinType.TWCoinTypeKava));
      expect(
          TWHRP.TWHRPBandChain, TWCoinTypeHRP(TWCoinType.TWCoinTypeBandChain));
      expect(TWHRP.TWHRPBluzelle, TWCoinTypeHRP(TWCoinType.TWCoinTypeBluzelle));
      expect(TWHRP.TWHRPCardano, TWCoinTypeHRP(TWCoinType.TWCoinTypeCardano));
      expect(TWHRP.TWHRPMultiversX,
          TWCoinTypeHRP(TWCoinType.TWCoinTypeMultiversX));
      expect(TWHRP.TWHRPOasis, TWCoinTypeHRP(TWCoinType.TWCoinTypeOasis));
      expect(
          TWHRP.TWHRPTHORChain, TWCoinTypeHRP(TWCoinType.TWCoinTypeTHORChain));
      expect(
          TWHRP.TWHRPCryptoOrg, TWCoinTypeHRP(TWCoinType.TWCoinTypeCryptoOrg));
      expect(TWHRP.TWHRPOsmosis, TWCoinTypeHRP(TWCoinType.TWCoinTypeOsmosis));
      expect(TWHRP.TWHRPECash, TWCoinTypeHRP(TWCoinType.TWCoinTypeECash));
      expect(TWHRP.TWHRPSecret, TWCoinTypeHRP(TWCoinType.TWCoinTypeSecret));

      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeAion));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeCallisto));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeDash));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeDecred));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeDogecoin));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeEOS));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeEthereum));
      expect(TWHRP.TWHRPUnknown,
          TWCoinTypeHRP(TWCoinType.TWCoinTypeEthereumClassic));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeGoChain));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeICON));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeKin));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeNULS));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeNano));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeNimiq));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeOntology));
      expect(
          TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypePOANetwork));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeXRP));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeStellar));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeTezos));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeTheta));
      expect(
          TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeThunderCore));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeViction));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeTron));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeVeChain));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeWanchain));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeZcash));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeFiro));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeZelcash));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeRavencoin));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeWaves));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeNEO));
      expect(TWHRP.TWHRPUnknown, TWCoinTypeHRP(TWCoinType.TWCoinTypeNebl));
    });
  });
}

part of '../wallet_core_bindings.dart';

///  Registered human-readable parts for BIP-0173
///
/// - SeeAlso: https://github.com/satoshilabs/slips/blob/master/slip-0173.md
enum TWHRP {
  Unknown(0),
  Bitcoin(1),
  Litecoin(2),
  Viacoin(3),
  Groestlcoin(4),
  DigiByte(5),
  Monacoin(6),
  Syscoin(7),
  Verge(8),
  Cosmos(9),
  BitcoinCash(10),
  BitcoinGold(11),
  IoTeX(12),
  Nervos(13),
  Zilliqa(14),
  Terra(15),
  CryptoOrg(16),
  Kava(17),
  Oasis(18),
  Bluzelle(19),
  BandChain(20),
  MultiversX(21),
  Secret(22),
  Agoric(23),
  Binance(24),
  ECash(25),
  THORChain(26),
  BitcoinDiamond(27),
  Harmony(28),
  Cardano(29),
  Qtum(30),
  Stratis(31),
  NativeInjective(32),
  Osmosis(33),
  TerraV2(34),
  Coreum(35),
  NativeZetaChain(36),
  NativeCanto(37),
  Sommelier(38),
  FetchAI(39),
  Mars(40),
  Umee(41),
  Quasar(42),
  Persistence(43),
  Akash(44),
  Noble(45),
  Sei(46),
  Stargaze(47),
  NativeEvmos(48),
  Tia(49),
  Dydx(50),
  Juno(51),
  TBinance(52),
  Stride(53),
  Axelar(54),
  Crescent(55),
  Kujira(56),
  Comdex(57),
  Neutron(58);

  final int hrp;

  const TWHRP(this.hrp);

  /// Find a hrp enum by its value.
  static TWHRP find(int hrp) {
    return values.firstWhere((element) => element.hrp == hrp,
        orElse: () => TWHRP.Unknown);
  }

  static TWHRP forString(String string) {
    return find(_hrpImpl.hrpForString(string));
  }

  String? get string => _hrpImpl.stringForHRP(hrp);
}

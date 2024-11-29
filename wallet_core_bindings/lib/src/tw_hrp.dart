part of '../wallet_core_bindings.dart';

///  Registered human-readable parts for BIP-0173
///
/// - SeeAlso: https://github.com/satoshilabs/slips/blob/master/slip-0173.md
enum TWHRP {
  Unknown,
  Bitcoin,
  Litecoin,
  Viacoin,
  Groestlcoin,
  DigiByte,
  Monacoin,
  Syscoin,
  Verge,
  Cosmos,
  BitcoinCash,
  BitcoinGold,
  IoTeX,
  Nervos,
  Zilliqa,
  Terra,
  CryptoOrg,
  Kava,
  Oasis,
  Bluzelle,
  BandChain,
  MultiversX,
  Secret,
  Agoric,
  Binance,
  ECash,
  THORChain,
  BitcoinDiamond,
  Harmony,
  Cardano,
  Qtum,
  Pactus,
  Stratis,
  NativeInjective,
  Osmosis,
  TerraV2,
  Coreum,
  NativeZetaChain,
  NativeCanto,
  Sommelier,
  FetchAI,
  Mars,
  Umee,
  Quasar,
  Persistence,
  Akash,
  Noble,
  Sei,
  Stargaze,
  NativeEvmos,
  Tia,
  Dydx,
  Juno,
  TBinance,
  Stride,
  Axelar,
  Crescent,
  Kujira,
  Comdex,
  Neutron;

  int get hrp => values.indexOf(this);

  /// Find a hrp enum by its value.
  static TWHRP find(int hrp) {
    if (values.length <= hrp) {
      return TWHRP.Unknown;
    }
    return values[hrp];
  }

  static TWHRP forString(String string) {
    return find(_hrpImpl.hrpForString(string));
  }

  String? get string => _hrpImpl.stringForHRP(hrp);
}

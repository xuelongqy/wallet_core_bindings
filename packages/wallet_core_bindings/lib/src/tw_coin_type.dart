part of '../wallet_core_bindings.dart';

/// Coin type for Level 2 of BIP44.
///
/// \see https://github.com/satoshilabs/slips/blob/master/slip-0044.md
class TWCoinType {
  final int value;

  const TWCoinType(this.value);

  /// Coin types
  static const TWCoinType Aeternity = TWCoinType(457);
  static const TWCoinType Aion = TWCoinType(425);
  static const TWCoinType Binance = TWCoinType(714);
  static const TWCoinType Bitcoin = TWCoinType(0);
  static const TWCoinType BitcoinCash = TWCoinType(145);
  static const TWCoinType BitcoinGold = TWCoinType(156);
  static const TWCoinType Callisto = TWCoinType(820);
  static const TWCoinType Cardano = TWCoinType(1815);
  static const TWCoinType Cosmos = TWCoinType(118);
  static const TWCoinType Pivx = TWCoinType(119);
  static const TWCoinType Dash = TWCoinType(5);
  static const TWCoinType Decred = TWCoinType(42);
  static const TWCoinType DigiByte = TWCoinType(20);
  static const TWCoinType Dogecoin = TWCoinType(3);
  static const TWCoinType EOS = TWCoinType(194);
  static const TWCoinType WAX = TWCoinType(14001);
  static const TWCoinType Ethereum = TWCoinType(60);
  static const TWCoinType EthereumClassic = TWCoinType(61);
  static const TWCoinType FIO = TWCoinType(235);
  static const TWCoinType GoChain = TWCoinType(6060);
  static const TWCoinType Groestlcoin = TWCoinType(17);
  static const TWCoinType ICON = TWCoinType(74);
  static const TWCoinType IoTeX = TWCoinType(304);
  static const TWCoinType Kava = TWCoinType(459);
  static const TWCoinType Kin = TWCoinType(2017);
  static const TWCoinType Litecoin = TWCoinType(2);
  static const TWCoinType Monacoin = TWCoinType(22);
  static const TWCoinType Nebulas = TWCoinType(2718);
  static const TWCoinType NULS = TWCoinType(8964);
  static const TWCoinType Nano = TWCoinType(165);
  static const TWCoinType NEAR = TWCoinType(397);
  static const TWCoinType Nimiq = TWCoinType(242);
  static const TWCoinType Ontology = TWCoinType(1024);
  static const TWCoinType POANetwork = TWCoinType(178);
  static const TWCoinType Qtum = TWCoinType(2301);
  static const TWCoinType XRP = TWCoinType(144);
  static const TWCoinType Solana = TWCoinType(501);
  static const TWCoinType Stellar = TWCoinType(148);
  static const TWCoinType Tezos = TWCoinType(1729);
  static const TWCoinType Theta = TWCoinType(500);
  static const TWCoinType ThunderCore = TWCoinType(1001);
  static const TWCoinType NEO = TWCoinType(888);
  static const TWCoinType Viction = TWCoinType(889);
  static const TWCoinType Tron = TWCoinType(195);
  static const TWCoinType VeChain = TWCoinType(818);
  static const TWCoinType Viacoin = TWCoinType(14);
  static const TWCoinType Wanchain = TWCoinType(5718350);
  static const TWCoinType Zcash = TWCoinType(133);
  static const TWCoinType Firo = TWCoinType(136);
  static const TWCoinType Zilliqa = TWCoinType(313);
  static const TWCoinType Zelcash = TWCoinType(19167);
  static const TWCoinType Ravencoin = TWCoinType(175);
  static const TWCoinType Waves = TWCoinType(5741564);
  static const TWCoinType Terra = TWCoinType(330);
  static const TWCoinType TerraV2 = TWCoinType(10000330);
  static const TWCoinType Harmony = TWCoinType(1023);
  static const TWCoinType Algorand = TWCoinType(283);
  static const TWCoinType Kusama = TWCoinType(434);
  static const TWCoinType Polkadot = TWCoinType(354);
  static const TWCoinType Filecoin = TWCoinType(461);
  static const TWCoinType MultiversX = TWCoinType(508);
  static const TWCoinType BandChain = TWCoinType(494);
  static const TWCoinType SmartChainLegacy = TWCoinType(10000714);
  static const TWCoinType SmartChain = TWCoinType(20000714);
  static const TWCoinType TBinance = TWCoinType(30000714);
  static const TWCoinType Oasis = TWCoinType(474);
  static const TWCoinType Polygon = TWCoinType(966);
  static const TWCoinType THORChain = TWCoinType(931);
  static const TWCoinType Bluzelle = TWCoinType(483);
  static const TWCoinType Optimism = TWCoinType(10000070);
  static const TWCoinType Zksync = TWCoinType(10000324);
  static const TWCoinType Arbitrum = TWCoinType(10042221);
  static const TWCoinType ECOChain = TWCoinType(10000553);
  static const TWCoinType AvalancheCChain = TWCoinType(10009000);
  static const TWCoinType XDai = TWCoinType(10000100);
  static const TWCoinType Fantom = TWCoinType(10000250);
  static const TWCoinType CryptoOrg = TWCoinType(394);
  static const TWCoinType Celo = TWCoinType(52752);
  static const TWCoinType Ronin = TWCoinType(10002020);
  static const TWCoinType Osmosis = TWCoinType(10000118);
  static const TWCoinType ECash = TWCoinType(899);
  static const TWCoinType IOST = TWCoinType(291);
  static const TWCoinType CronosChain = TWCoinType(10000025);
  static const TWCoinType SmartBitcoinCash = TWCoinType(10000145);
  static const TWCoinType KuCoinCommunityChain = TWCoinType(10000321);
  static const TWCoinType BitcoinDiamond = TWCoinType(999);
  static const TWCoinType Boba = TWCoinType(10000288);
  static const TWCoinType Syscoin = TWCoinType(57);
  static const TWCoinType Verge = TWCoinType(77);
  static const TWCoinType Zen = TWCoinType(121);
  static const TWCoinType Metis = TWCoinType(10001088);
  static const TWCoinType Aurora = TWCoinType(1323161554);
  static const TWCoinType Evmos = TWCoinType(10009001);
  static const TWCoinType NativeEvmos = TWCoinType(20009001);
  static const TWCoinType Moonriver = TWCoinType(10001285);
  static const TWCoinType Moonbeam = TWCoinType(10001284);
  static const TWCoinType KavaEvm = TWCoinType(10002222);
  static const TWCoinType Kaia = TWCoinType(10008217);
  static const TWCoinType Meter = TWCoinType(18000);
  static const TWCoinType OKXChain = TWCoinType(996);
  static const TWCoinType Stratis = TWCoinType(105105);
  static const TWCoinType Komodo = TWCoinType(141);
  static const TWCoinType Nervos = TWCoinType(309);
  static const TWCoinType Everscale = TWCoinType(396);
  static const TWCoinType Aptos = TWCoinType(637);
  static const TWCoinType Nebl = TWCoinType(146);
  static const TWCoinType Hedera = TWCoinType(3030);
  static const TWCoinType Secret = TWCoinType(529);
  static const TWCoinType NativeInjective = TWCoinType(10000060);
  static const TWCoinType Agoric = TWCoinType(564);
  static const TWCoinType TON = TWCoinType(607);
  static const TWCoinType Sui = TWCoinType(784);
  static const TWCoinType Stargaze = TWCoinType(20000118);
  static const TWCoinType PolygonzkEVM = TWCoinType(10001101);
  static const TWCoinType Juno = TWCoinType(30000118);
  static const TWCoinType Stride = TWCoinType(40000118);
  static const TWCoinType Axelar = TWCoinType(50000118);
  static const TWCoinType Crescent = TWCoinType(60000118);
  static const TWCoinType Kujira = TWCoinType(70000118);
  static const TWCoinType IoTeXEVM = TWCoinType(10004689);
  static const TWCoinType NativeCanto = TWCoinType(10007700);
  static const TWCoinType Comdex = TWCoinType(80000118);
  static const TWCoinType Neutron = TWCoinType(90000118);
  static const TWCoinType Sommelier = TWCoinType(11000118);
  static const TWCoinType FetchAI = TWCoinType(12000118);
  static const TWCoinType Mars = TWCoinType(13000118);
  static const TWCoinType Umee = TWCoinType(14000118);
  static const TWCoinType Coreum = TWCoinType(10000990);
  static const TWCoinType Quasar = TWCoinType(15000118);
  static const TWCoinType Persistence = TWCoinType(16000118);
  static const TWCoinType Akash = TWCoinType(17000118);
  static const TWCoinType Noble = TWCoinType(18000118);
  static const TWCoinType Scroll = TWCoinType(534352);
  static const TWCoinType Rootstock = TWCoinType(137);
  static const TWCoinType ThetaFuel = TWCoinType(361);
  static const TWCoinType ConfluxeSpace = TWCoinType(1030);
  static const TWCoinType Acala = TWCoinType(787);
  static const TWCoinType AcalaEVM = TWCoinType(10000787);
  static const TWCoinType OpBNB = TWCoinType(204);
  static const TWCoinType Neon = TWCoinType(245022934);
  static const TWCoinType Base = TWCoinType(8453);
  static const TWCoinType Sei = TWCoinType(19000118);
  static const TWCoinType ArbitrumNova = TWCoinType(10042170);
  static const TWCoinType Linea = TWCoinType(59144);
  static const TWCoinType Greenfield = TWCoinType(5600);
  static const TWCoinType Mantle = TWCoinType(5000);
  static const TWCoinType ZenEON = TWCoinType(7332);
  static const TWCoinType InternetComputer = TWCoinType(223);
  static const TWCoinType Tia = TWCoinType(21000118);
  static const TWCoinType MantaPacific = TWCoinType(169);
  static const TWCoinType NativeZetaChain = TWCoinType(10007000);
  static const TWCoinType ZetaEVM = TWCoinType(20007000);
  static const TWCoinType Dydx = TWCoinType(22000118);
  static const TWCoinType Merlin = TWCoinType(4200);
  static const TWCoinType Lightlink = TWCoinType(1890);
  static const TWCoinType Blast = TWCoinType(81457);
  static const TWCoinType BounceBit = TWCoinType(6001);
  static const TWCoinType ZkLinkNova = TWCoinType(810180);
  static const TWCoinType Pactus = TWCoinType(21888);
  static const TWCoinType Sonic = TWCoinType(10000146);
  static const TWCoinType Polymesh = TWCoinType(595);
  static const TWCoinType Plasma = TWCoinType(9745);
  static const TWCoinType Monad = TWCoinType(10143);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TWCoinType) return false;
    return value == other.value;
  }

  /// Find a coin type by its value.
  static TWCoinType find(int value) => TWCoinType(value);

  /// Returns the blockchain for a coin type.
  ///
  /// \return blockchain associated to the given coin type
  TWBlockchain get blockchain =>
      TWBlockchain.find(_coinTypeImpl.blockchain(value));

  /// Returns the purpose for a coin type.
  ///
  /// \return purpose associated to the given coin type
  TWPurpose get purpose => TWPurpose.find(_coinTypeImpl.purpose(value));

  /// Returns the curve that should be used for a coin type.
  ///
  /// \return curve that should be used for the given coin type
  TWCurve get curve => TWCurve.find(_coinTypeImpl.curve(value));

  /// Returns the xpub HD version that should be used for a coin type.
  ///
  /// \return xpub HD version that should be used for the given coin type
  TWHDVersion get xpubVersion =>
      TWHDVersion.find(_coinTypeImpl.xpubVersion(value));

  /// Returns the xprv HD version that should be used for a coin type.
  ///
  /// \return the xprv HD version that should be used for the given coin type.
  TWHDVersion get xprvVersion =>
      TWHDVersion.find(_coinTypeImpl.xprvVersion(value));

  /// Validates an address string.
  ///
  /// \param [address] A public address
  /// \return true if the address is a valid public address of the given coin, false otherwise.
  bool validate(String address) =>
      _coinTypeImpl.validate(value, TWString(address).pointer);

  /// Returns the default derivation path for a particular coin.
  ///
  /// \return the default derivation path for the given coin type.
  String get derivationPath =>
      TWString.fromPointer(_coinTypeImpl.derivationPath(value)).value!;

  /// Returns the derivation path for a particular coin with the explicit given derivation.
  ///
  /// \param [derivation] A derivation type
  /// \return the derivation path for the given coin with the explicit given derivation
  String derivationPathWithDerivation(TWDerivation derivation) =>
      TWString.fromPointer(_coinTypeImpl.derivationPathWithDerivation(
              value, derivation.value))
          .value!;

  /// Derives the address for a particular coin from the private key.
  ///
  /// \param [privateKey] A valid private key
  /// \return Derived address for the given coin from the private key.
  String deriveAddress(TWPrivateKey privateKey) => TWString.fromPointer(
          _coinTypeImpl.deriveAddress(value, privateKey.pointer))
      .value!;

  /// Derives the address for a particular coin from the public key.
  ///
  /// \param [publicKey] A valid public key
  /// \return Derived address for the given coin from the public key.
  String deriveAddressFromPublicKey(TWPublicKey publicKey) =>
      TWString.fromPointer(_coinTypeImpl.deriveAddressFromPublicKey(
              value, publicKey.pointer))
          .value!;

  /// Derives the address for a particular coin from the public key with the derivation.
  String deriveAddressFromPublicKeyAndDerivation(
          TWPublicKey publicKey, TWDerivation derivation) =>
      TWString.fromPointer(
          _coinTypeImpl.deriveAddressFromPublicKeyAndDerivation(
        value,
        publicKey.pointer,
        derivation.value,
      )).value!;

  /// HRP for this coin type
  ///
  /// \return HRP of the given coin type.
  TWHRP get hrp => TWHRP.find(_coinTypeImpl.hrp(value));

  /// P2PKH prefix for this coin type
  ///
  /// \return P2PKH prefix for the given coin type
  int get p2pkhPrefix => _coinTypeImpl.p2pkhPrefix(value);

  /// P2SH prefix for this coin type
  ///
  /// \return P2SH prefix for the given coin type
  int get p2shPrefix => _coinTypeImpl.p2shPrefix(value);

  /// Static prefix for this coin type
  ///
  /// \return Static prefix for the given coin type
  int get staticPrefix => _coinTypeImpl.staticPrefix(value);

  /// ChainID for this coin type.
  ///
  /// \return ChainID for the given coin type.
  /// \note Caller must free returned object.
  String get chainId =>
      TWString.fromPointer(_coinTypeImpl.chainId(value)).value!;

  /// SLIP-0044 id for this coin type
  ///
  /// \return SLIP-0044 id for the given coin type
  int get slip44Id => _coinTypeImpl.slip44Id(value);

  /// SS58Prefix for this coin type
  ///
  /// \param [value] A coin type
  /// \return SS58Prefix for the given coin type
  int get ss58Prefix => _coinTypeImpl.ss58Prefix(value);

  /// public key type for this coin type
  ///
  /// \param [value] A coin type
  /// \return public key type for the given coin type
  TWPublicKeyType get publicKeyType =>
      TWPublicKeyType.find(_coinTypeImpl.publicKeyType(value));
}

part of '../wallet_core_bindings.dart';

/// Coin type for Level 2 of BIP44.
///
/// \see https://github.com/satoshilabs/slips/blob/master/slip-0044.md
enum TWCoinType {
  Aeternity(457),
  Aion(425),
  Binance(714),
  Bitcoin(0),
  BitcoinCash(145),
  BitcoinGold(156),
  Callisto(820),
  Cardano(1815),
  Cosmos(118),
  Pivx(119),
  Dash(5),
  Decred(42),
  DigiByte(20),
  Dogecoin(3),
  EOS(194),
  WAX(14001),
  Ethereum(60),
  EthereumClassic(61),
  FIO(235),
  GoChain(6060),
  Groestlcoin(17),
  ICON(74),
  IoTeX(304),
  Kava(459),
  Kin(2017),
  Litecoin(2),
  Monacoin(22),
  Nebulas(2718),
  NULS(8964),
  Nano(165),
  NEAR(397),
  Nimiq(242),
  Ontology(1024),
  POANetwork(178),
  Qtum(2301),
  XRP(144),
  Solana(501),
  Stellar(148),
  Tezos(1729),
  Theta(500),
  ThunderCore(1001),
  NEO(888),
  Viction(889),
  Tron(195),
  VeChain(818),
  Viacoin(14),
  Wanchain(5718350),
  Zcash(133),
  Firo(136),
  Zilliqa(313),
  Zelcash(19167),
  Ravencoin(175),
  Waves(5741564),
  Terra(330),
  TerraV2(10000330),
  Harmony(1023),
  Algorand(283),
  Kusama(434),
  Polkadot(354),
  Filecoin(461),
  MultiversX(508),
  BandChain(494),
  SmartChainLegacy(10000714),
  SmartChain(20000714),
  TBinance(30000714),
  Oasis(474),
  Polygon(966),
  THORChain(931),
  Bluzelle(483),
  Optimism(10000070),
  Zksync(10000324),
  Arbitrum(10042221),
  ECOChain(10000553),
  AvalancheCChain(10009000),
  XDai(10000100),
  Fantom(10000250),
  CryptoOrg(394),
  Celo(52752),
  Ronin(10002020),
  Osmosis(10000118),
  ECash(899),
  IOST(291),
  CronosChain(10000025),
  SmartBitcoinCash(10000145),
  KuCoinCommunityChain(10000321),
  BitcoinDiamond(999),
  Boba(10000288),
  Syscoin(57),
  Verge(77),
  Zen(121),
  Metis(10001088),
  Aurora(1323161554),
  Evmos(10009001),
  NativeEvmos(20009001),
  Moonriver(10001285),
  Moonbeam(10001284),
  KavaEvm(10002222),
  Klaytn(10008217),
  Meter(18000),
  OKXChain(996),
  Stratis(105105),
  Komodo(141),
  Nervos(309),
  Everscale(396),
  Aptos(637),
  Nebl(146),
  Hedera(3030),
  Secret(529),
  NativeInjective(10000060),
  Agoric(564),
  TON(607),
  Sui(784),
  Stargaze(20000118),
  PolygonzkEVM(10001101),
  Juno(30000118),
  Stride(40000118),
  Axelar(50000118),
  Crescent(60000118),
  Kujira(70000118),
  IoTeXEVM(10004689),
  NativeCanto(10007700),
  Comdex(80000118),
  Neutron(90000118),
  Sommelier(11000118),
  FetchAI(12000118),
  Mars(13000118),
  Umee(14000118),
  Coreum(10000990),
  Quasar(15000118),
  Persistence(16000118),
  Akash(17000118),
  Noble(18000118),
  Scroll(534352),
  Rootstock(137),
  ThetaFuel(361),
  ConfluxeSpace(1030),
  Acala(787),
  AcalaEVM(10000787),
  OpBNB(204),
  Neon(245022934),
  Base(8453),
  Sei(19000118),
  ArbitrumNova(10042170),
  Linea(59144),
  Greenfield(5600),
  Mantle(5000),
  ZenEON(7332),
  InternetComputer(223),
  Tia(21000118),
  MantaPacific(169),
  NativeZetaChain(10007000),
  ZetaEVM(20007000),
  Dydx(22000118),
  Merlin(4200),
  Lightlink(1890),
  Blast(81457),
  BounceBit(6001);

  final int coin;

  const TWCoinType(this.coin);

  /// Find a coin type by its value.
  static TWCoinType find(int coin) {
    return TWCoinType.values.firstWhere((element) => element.coin == coin);
  }

  /// Returns the blockchain for a coin type.
  ///
  /// \return blockchain associated to the given coin type
  TWBlockchain get blockchain =>
      TWBlockchain.find(_coinTypeImpl.blockchain(coin));

  /// Returns the purpose for a coin type.
  ///
  /// \return purpose associated to the given coin type
  TWPurpose get purpose => TWPurpose.find(_coinTypeImpl.purpose(coin));

  /// Returns the curve that should be used for a coin type.
  ///
  /// \return curve that should be used for the given coin type
  TWCurve get curve => TWCurve.find(_coinTypeImpl.curve(coin));

  /// Returns the xpub HD version that should be used for a coin type.
  ///
  /// \return xpub HD version that should be used for the given coin type
  TWHDVersion get xpubVersion =>
      TWHDVersion.find(_coinTypeImpl.xpubVersion(coin));

  /// Returns the xprv HD version that should be used for a coin type.
  ///
  /// \return the xprv HD version that should be used for the given coin type.
  TWHDVersion get xprvVersion =>
      TWHDVersion.find(_coinTypeImpl.xprvVersion(coin));

  /// Validates an address string.
  ///
  /// \param [address] A public address
  /// \return true if the address is a valid public address of the given coin, false otherwise.
  bool validate(String address) => _coinTypeImpl.validate(coin, address);

  /// Returns the default derivation path for a particular coin.
  ///
  /// \return the default derivation path for the given coin type.
  String derivationPath(int coin) => _coinTypeImpl.derivationPath(coin);

  /// Returns the derivation path for a particular coin with the explicit given derivation.
  ///
  /// \param [derivation] A derivation type
  /// \return the derivation path for the given coin with the explicit given derivation
  String derivationPathWithDerivation(int coin, TWDerivation derivation) =>
      _coinTypeImpl.derivationPathWithDerivation(coin, derivation.derivation);

  /// Derives the address for a particular coin from the private key.
  ///
  /// \param [privateKey] A valid private key
  /// \return Derived address for the given coin from the private key.
  String deriveAddress(int coin, TWPrivateKey privateKey) =>
      _coinTypeImpl.deriveAddress(coin, privateKey.pointer);

  /// Derives the address for a particular coin from the public key.
  ///
  /// \param [publicKey] A valid public key
  /// \return Derived address for the given coin from the public key.
  String deriveAddressFromPublicKey(int coin, TWPublicKey publicKey) =>
      _coinTypeImpl.deriveAddressFromPublicKey(coin, publicKey.pointer);

  /// Derives the address for a particular coin from the public key with the derivation.
  String deriveAddressFromPublicKeyAndDerivation(
          int coin, TWPublicKey publicKey, TWDerivation derivation) =>
      _coinTypeImpl.deriveAddressFromPublicKeyAndDerivation(
        coin,
        publicKey.pointer,
        derivation.derivation,
      );

  /// HRP for this coin type
  ///
  /// \return HRP of the given coin type.
  TWHRP get hrp => TWHRP.find(_coinTypeImpl.hrp(coin));

  /// P2PKH prefix for this coin type
  ///
  /// \return P2PKH prefix for the given coin type
  int get p2pkhPrefix => _coinTypeImpl.p2pkhPrefix(coin);

  /// P2SH prefix for this coin type
  ///
  /// \return P2SH prefix for the given coin type
  int get p2shPrefix => _coinTypeImpl.p2shPrefix(coin);

  /// Static prefix for this coin type
  ///
  /// \return Static prefix for the given coin type
  int get staticPrefix => _coinTypeImpl.staticPrefix(coin);

  /// ChainID for this coin type.
  ///
  /// \return ChainID for the given coin type.
  /// \note Caller must free returned object.
  String get chainId => _coinTypeImpl.chainId(coin);

  /// SLIP-0044 id for this coin type
  ///
  /// \return SLIP-0044 id for the given coin type
  int get slip44Id => _coinTypeImpl.slip44Id(coin);

  /// SS58Prefix for this coin type
  ///
  /// \param [coin] A coin type
  /// \return SS58Prefix for the given coin type
  int get ss58Prefix => _coinTypeImpl.ss58Prefix(coin);

  /// public key type for this coin type
  ///
  /// \param [coin] A coin type
  /// \return public key type for the given coin type
  TWPublicKeyType publicKeyType(int coin) =>
      TWPublicKeyType.find(_coinTypeImpl.publicKeyType(coin));
}

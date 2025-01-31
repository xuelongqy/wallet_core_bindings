part of '../wallet_core_bindings.dart';

/// Chain identifiers for Ethereum-based blockchains, for convenience. Recommended to use the dynamic CoinType.ChainId() instead.
/// See also TWChainId.
enum TWEthereumChainID {
  Ethereum(1),
  Classic(61),
  Rootstock(30),
  Manta(169),
  Poa(99),
  Opbnb(204),
  Tfuelevm(361),
  Vechain(74),
  Callisto(820),
  Viction(88),
  Polygon(137),
  Okc(66),
  Thundertoken(108),
  Cfxevm(1030),
  Lightlink(1890),
  Merlin(4200),
  Mantle(5000),
  Bouncebit(6001),
  Gochain(60),
  Zeneon(7332),
  Base(8453),
  Meter(82),
  Celo(42220),
  Linea(59144),
  Blast(81457),
  Scroll(534352),
  Zklinknova(534352),
  Wanchain(888),
  Cronos(25),
  Optimism(10),
  Xdai(100),
  Smartbch(10000),
  Sonic(146),
  Fantom(250),
  Boba(288),
  Kcc(321),
  Zksync(324),
  Acalaevm(787),
  Metis(1088),
  Polygonzkevm(1101),
  Moonbeam(1284),
  Moonriver(1285),
  Ronin(2020),
  Kavaevm(2222),
  Iotexevm(4689),
  Kaia(8217),
  Avalanchec(43114),
  Evmos(9001),
  Arbitrumnova(42170),
  Arbitrum(42161),
  Smartchain(56),
  Zetaevm(7000),
  Neon(245022934),
  Aurora(1313161554);

  final int id;

  const TWEthereumChainID(this.id);

  /// Find a chain ID by its value.
  static TWEthereumChainID find(int id) {
    return values.firstWhere((element) => element.id == id);
  }
}

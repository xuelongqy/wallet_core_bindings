part of '../wallet_core_bindings.dart';

/// Blockchain enum type
enum TWBlockchain {
  Bitcoin(0),
  Ethereum(1),
  Vechain(3),
  Tron(4),
  Icon(5),
  Binance(6),
  Ripple(7),
  Tezos(8),
  Nimiq(9),
  Stellar(10),
  Aion(11),
  Cosmos(12),
  Theta(13),
  Ontology(14),
  Zilliqa(15),
  IoTeX(16),
  EOS(17),
  Nano(18),
  NULS(19),
  Waves(20),
  Aeternity(21),
  Nebulas(22),
  FIO(23),
  Solana(24),
  Harmony(25),
  NEAR(26),
  Algorand(27),
  IOST(28),
  Polkadot(29),
  Cardano(30),
  NEO(31),
  Filecoin(32),
  MultiversX(33),
  OasisNetwork(34),
  Decred(35),
  Zcash(36),
  Groestlcoin(37),
  Thorchain(38),
  Ronin(39),
  Kusama(40),
  Zen(41),
  BitcoinDiamond(42),
  Verge(43),
  Nervos(44),
  Everscale(45),
  Aptos(46),
  Nebl(47),
  Hedera(48),
  TheOpenNetwork(49),
  Sui(50),
  Greenfield(51),
  InternetComputer(52),
  NativeEvmos(53),
  NativeInjective(54),
  BitcoinCash(55);

  final int blockchain;

  const TWBlockchain(this.blockchain);

  /// Find a blockchain by its value.
  static TWBlockchain find(int blockchain) {
    return TWBlockchain.values
        .firstWhere((element) => element.blockchain == blockchain);
  }
}

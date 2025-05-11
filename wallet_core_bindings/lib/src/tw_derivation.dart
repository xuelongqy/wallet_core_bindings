part of '../wallet_core_bindings.dart';

/// Non-default coin address derivation names (default, unnamed derivations are not included).
enum TWDerivation {
  Default(0),
  Custom(1),
  BitcoinSegwit(2),
  BitcoinLegacy(3),
  BitcoinTestnet(4),
  LitecoinLegacy(5),
  SolanaSolana(6),
  StratisSegwit(7),
  BitcoinTaproot(8),
  PactusMainnet(9),
  PactusTestnet(10);

  final int value;

  const TWDerivation(this.value);

  /// Find a derivation enum by its value.
  static TWDerivation find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}

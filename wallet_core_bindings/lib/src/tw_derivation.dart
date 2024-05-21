part of '../wallet_core_bindings.dart';

/// Non-default coin address derivation names (default, unnamed derivations are not included).
enum TWDerivation {
  Default(0),
  Custom(1),
  BitcoinSegwit(2),
  BitcoinLegacy(3),
  BitcoinTestnet(4),
  LitecoinLegacy(5),
  SolanaSolana(6);

  final int derivation;

  const TWDerivation(this.derivation);

  /// Find a derivation enum by its value.
  static TWDerivation find(int derivation) {
    return values.firstWhere((element) => element.derivation == derivation);
  }
}

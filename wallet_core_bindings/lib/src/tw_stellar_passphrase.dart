part of '../wallet_core_bindings.dart';

/// Stellar network passphrase string.
enum TWStellarPassphrase {
  Stellar(0),
  Kin(1);

  final int passphrase;

  const TWStellarPassphrase(this.passphrase);

  /// Find a Stellar passphrase enum by its value.
  static TWStellarPassphrase find(int passphrase) {
    return values.firstWhere((element) => element.passphrase == passphrase);
  }
}

const TWStellarPassphrase_Stellar =
    "Public Global Stellar Network ; September 2015";
const TWStellarPassphrase_Kin = "Kin Mainnet ; December 2018";

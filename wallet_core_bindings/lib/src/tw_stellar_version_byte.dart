part of '../wallet_core_bindings.dart';

/// Stellar address version byte.
enum TWStellarVersionByte {
  AccountID(48),
  Seed(192),
  PreAuthTX(200),
  SHA256Hash(280);

  final int value;

  const TWStellarVersionByte(this.value);

  /// Find a Stellar version byte enum by its value.
  static TWStellarVersionByte find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}

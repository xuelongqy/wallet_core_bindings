part of '../wallet_core_bindings.dart';

/// Stellar address version byte.
enum TWStellarVersionByte {
  AccountID(48),
  Seed(192),
  PreAuthTX(200),
  SHA256Hash(280);

  final int byte;

  const TWStellarVersionByte(this.byte);

  /// Find a Stellar version byte enum by its value.
  static TWStellarVersionByte find(int byte) {
    return values.firstWhere((element) => element.byte == byte);
  }
}

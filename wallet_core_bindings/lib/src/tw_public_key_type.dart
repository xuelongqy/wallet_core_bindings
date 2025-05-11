part of '../wallet_core_bindings.dart';

/// Public key types
enum TWPublicKeyType {
  SECP256k1(0),
  SECP256k1Extended(1),
  NIST256p1(2),
  NIST256p1Extended(3),
  ED25519(4),
  ED25519Blake2b(5),
  CURVE25519(6),
  ED25519Cardano(7),
  Starkex(8);

  final int value;

  const TWPublicKeyType(this.value);

  /// Find a public key type enum by its value.
  static TWPublicKeyType find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}

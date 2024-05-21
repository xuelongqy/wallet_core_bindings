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

  final int type;

  const TWPublicKeyType(this.type);

  static TWPublicKeyType find(int type) {
    return values.firstWhere((element) => element.type == type);
  }
}

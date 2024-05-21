part of '../wallet_core_bindings.dart';

/// Elliptic cruves
enum TWCurve {
  SECP256k1(0),
  ED25519(1),
  ED25519Blake2bNano(2),
  Curve25519(3),
  NIST256p1(4),
  ED25519ExtendedCardano(5),
  Starkex(6),
  None(7);

  final int curve;

  const TWCurve(this.curve);

  /// Find a curve enum by its value.
  static TWCurve find(int value) {
    return values.firstWhere((element) => element.curve == value);
  }
}

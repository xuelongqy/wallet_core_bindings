part of '../wallet_core_bindings.dart';

/// Private key types
enum TWPrivateKeyType {
  Default(0),
  Cardano(1);

  final int type;

  const TWPrivateKeyType(this.type);

  /// Find a private key type enum by its value.
  static TWPrivateKeyType find(int type) {
    return values.firstWhere((element) => element.type == type);
  }
}

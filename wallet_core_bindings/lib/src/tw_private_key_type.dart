part of '../wallet_core_bindings.dart';

/// Private key types
enum TWPrivateKeyType {
  Default(0),
  Cardano(1);

  final int value;

  const TWPrivateKeyType(this.value);

  /// Find a private key type enum by its value.
  static TWPrivateKeyType find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}

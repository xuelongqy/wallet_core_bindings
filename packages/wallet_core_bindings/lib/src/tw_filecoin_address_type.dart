part of '../wallet_core_bindings.dart';

/// Filecoin address type.
enum TWFilecoinAddressType {
  Default(0),
  Delegated(1);

  final int value;

  const TWFilecoinAddressType(this.value);

  /// Find a Filecoin address type enum by its value.
  static TWFilecoinAddressType find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}

part of '../wallet_core_bindings.dart';

/// Filecoin address type.
enum TWFilecoinAddressType {
  Default(0),
  Delegated(1);

  final int type;

  const TWFilecoinAddressType(this.type);

  /// Find a Filecoin address type enum by its value.
  static TWFilecoinAddressType find(int type) {
    return values.firstWhere((element) => element.type == type);
  }
}

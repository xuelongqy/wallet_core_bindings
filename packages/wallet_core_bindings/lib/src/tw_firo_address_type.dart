part of '../wallet_core_bindings.dart';

/// Firo address type.
enum TWFiroAddressType {
  Default(0),
  Exchange(1);

  final int value;

  const TWFiroAddressType(this.value);

  /// Find a Firo address type enum by its value.
  static TWFiroAddressType find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}

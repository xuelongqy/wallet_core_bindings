part of '../wallet_core_bindings.dart';

/// Firo address type.
enum TWFiroAddressType {
  Default(0),
  Exchange(1);

  final int type;

  const TWFiroAddressType(this.type);
}

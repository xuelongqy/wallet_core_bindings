part of '../wallet_core_bindings.dart';

/// Substrate based chains Address Type
enum TWSS58AddressType {
  Polkadot(0),
  Kusama(2);

  final int type;

  const TWSS58AddressType(this.type);

  /// Find a SS58 address type enum by its value.
  static TWSS58AddressType find(int type) {
    return values.firstWhere((element) => element.type == type);
  }
}

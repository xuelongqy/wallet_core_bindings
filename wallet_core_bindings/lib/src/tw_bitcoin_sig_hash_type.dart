part of '../wallet_core_bindings.dart';

/// Bitcoin SIGHASH type.
enum TWBitcoinSigHashType {
  All(1),
  None(2),
  Single(3),
  Fork(64),
  ForkBTG(20288),
  AnyoneCanPay(128);

  final int type;

  const TWBitcoinSigHashType(this.type);

  /// Find a Bitcoin sig hash type by its value.
  static TWBitcoinSigHashType find(int type) {
    return values.firstWhere((element) => element.type == type);
  }

  /// Determines if the given sig hash is single
  ///
  /// \return true if the sigh hash type is single, false otherwise
  bool get isSingle => _bitcoinSigHashTypeImpl.isSingle(type);

  /// Determines if the given sig hash is none
  ///
  /// \return true if the sigh hash type is none, false otherwise
  bool get isNone => _bitcoinSigHashTypeImpl.isNone(type);
}

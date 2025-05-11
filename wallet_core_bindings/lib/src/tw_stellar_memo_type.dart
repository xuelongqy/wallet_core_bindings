part of '../wallet_core_bindings.dart';

/// Stellar memo type.
enum TWStellarMemoType {
  None(0),
  Text(1),
  Id(2),
  Hash(3),
  Return(4);

  final int value;

  const TWStellarMemoType(this.value);

  /// Find a Stellar memo type enum by its value.
  static TWStellarMemoType find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}

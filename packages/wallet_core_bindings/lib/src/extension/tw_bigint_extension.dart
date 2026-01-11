part of '../../wallet_core_bindings.dart';

/// BigInt extension
extension TWBigIntExtension on BigInt {
  /// int to Int64
  Int64 toInt64() {
    return Int64.parseInt(toString());
  }
}

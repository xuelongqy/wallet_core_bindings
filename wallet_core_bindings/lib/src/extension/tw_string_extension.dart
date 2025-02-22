part of '../../wallet_core_bindings.dart';

/// String extension
extension TWStringExtension on String {
  /// int to Int64
  Int64 toInt64([int radix = 10]) {
    return Int64.parseRadix(this, radix);
  }
}

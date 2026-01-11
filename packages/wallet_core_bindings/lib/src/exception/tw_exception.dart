part of '../../wallet_core_bindings.dart';

/// Trust wallet exception.
class TWException implements Exception {
  final String message;

  TWException(this.message);

  @override
  String toString() {
    return 'TWException: $message';
  }
}

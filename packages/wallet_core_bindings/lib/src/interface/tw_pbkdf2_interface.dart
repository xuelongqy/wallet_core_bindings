part of '../../wallet_core_bindings.dart';

/// [TWPBKDF2] interface.
abstract class TWPBKDF2Interface {
  int hmacSha256(int password, int salt, int iterations, int dkLen);

  int hmacSha512(int password, int salt, int iterations, int dkLen);
}

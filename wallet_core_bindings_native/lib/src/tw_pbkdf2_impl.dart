part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWPBKDF2].
class TWPBKDF2Impl extends TWPBKDF2Interface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWPBKDF2Impl(this.bindings);

  @override
  int hmacSha256(int password, int salt, int iterations, int dkLen) {
    return bindings.TWPBKDF2HmacSha256(
      Pointer.fromAddress(password),
      Pointer.fromAddress(salt),
      iterations,
      dkLen,
    ).address;
  }

  @override
  int hmacSha512(int password, int salt, int iterations, int dkLen) {
    return bindings.TWPBKDF2HmacSha512(
      Pointer.fromAddress(password),
      Pointer.fromAddress(salt),
      iterations,
      dkLen,
    ).address;
  }
}

part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWPBKDF2].
class TWPBKDF2Impl extends TWPBKDF2Interface {
  final WasmInstance wasm;

  TWPBKDF2Impl(this.wasm);

  @override
  int hmacSha256(int password, int salt, int iterations, int dkLen) {
    final func = wasm.getFunction('TWPBKDF2HmacSha256')!;
    return func([password, salt, iterations, dkLen]).first as int;
  }

  @override
  int hmacSha512(int password, int salt, int iterations, int dkLen) {
    final func = wasm.getFunction('TWPBKDF2HmacSha512')!;
    return func([password, salt, iterations, dkLen]).first as int;
  }
}

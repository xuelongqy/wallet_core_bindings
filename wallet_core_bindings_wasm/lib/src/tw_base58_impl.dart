part of '../wallet_core_bindings_wasm.dart';

/// Native interface for [TWBase58].
class TWBase58Impl extends TWBase58Interface {
  final WasmInstance wasm;

  TWBase58Impl(this.wasm);

  @override
  int decode(int string) {
    final func = wasm.getFunction('TWBase58Decode')!;
    return func([string]).first as int;
  }

  @override
  int decodeNoCheck(int string) {
    final func = wasm.getFunction('TWBase58DecodeNoCheck')!;
    return func([string]).first as int;
  }

  @override
  int encode(int data) {
    final func = wasm.getFunction('TWBase58Encode')!;
    return func([data]).first as int;
  }

  @override
  int encodeNoCheck(int data) {
    final func = wasm.getFunction('TWBase58EncodeNoCheck')!;
    return func([data]).first as int;
  }
}

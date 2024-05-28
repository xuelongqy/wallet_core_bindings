part of '../wallet_core_bindings_wasm.dart';

/// Native interface for [TWBase64].
class TWBase64Impl extends TWBase64Interface {
  final WasmInstance wasm;

  TWBase64Impl(this.wasm);

  @override
  int decode(int string) {
    final func = wasm.getFunction('TWBase64Decode')!;
    return func([string]).first as int;
  }

  @override
  int decodeUrl(int string) {
    final func = wasm.getFunction('TWBase64DecodeUrl')!;
    return func([string]).first as int;
  }

  @override
  int encode(int data) {
    final func = wasm.getFunction('TWBase64Encode')!;
    return func([data]).first as int;
  }

  @override
  int encodeUrl(int data) {
    final func = wasm.getFunction('TWBase64EncodeUrl')!;
    return func([data]).first as int;
  }
}

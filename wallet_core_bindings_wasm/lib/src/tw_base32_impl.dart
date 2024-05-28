part of '../wallet_core_bindings_wasm.dart';

/// Native interface for [TWBase32].
class TWBase32Impl extends TWBase32Interface {
  final WasmInstance wasm;

  TWBase32Impl(this.wasm);

  @override
  int decode(int string) {
    final func = wasm.getFunction('TWBase32Decode')!;
    return func([string]).first as int;
  }

  @override
  int decodeWithAlphabet(int string, int alphabet) {
    final func = wasm.getFunction('TWBase32DecodeWithAlphabet')!;
    return func([string, alphabet]).first as int;
  }

  @override
  int encode(int data) {
    final func = wasm.getFunction('TWBase32Encode')!;
    return func([data]).first as int;
  }

  @override
  int encodeWithAlphabet(int data, int alphabet) {
    final func = wasm.getFunction('TWBase32EncodeWithAlphabet')!;
    return func([data, alphabet]).first as int;
  }
}

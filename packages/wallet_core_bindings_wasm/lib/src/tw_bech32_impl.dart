part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWBech32].
class TWBech32Impl extends TWBech32Interface {
  final WasmInstance wasm;

  TWBech32Impl(this.wasm);

  @override
  int decode(int string) {
    final func = wasm.getFunction('TWBech32Decode')!;
    return func([string]).first as int;
  }

  @override
  int decodeM(int string) {
    final func = wasm.getFunction('TWBech32DecodeM')!;
    return func([string]).first as int;
  }

  @override
  int encode(int hrp, int data) {
    final func = wasm.getFunction('TWBech32Encode')!;
    return func([hrp, data]).first as int;
  }

  @override
  int encodeM(int hrp, int data) {
    final func = wasm.getFunction('TWBech32EncodeM')!;
    return func([hrp, data]).first as int;
  }
}

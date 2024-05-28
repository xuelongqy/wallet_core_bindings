part of '../wallet_core_bindings_wasm.dart';

/// Native interface for [TWAnySigner].
class TWAnySignerImpl extends TWAnySignerInterface {
  final WasmInstance wasm;

  TWAnySignerImpl(this.wasm);

  @override
  int plan(int input, int coin) {
    final func = wasm.getFunction('TWAnySignerPlan')!;
    return func([input, coin]).first as int;
  }

  @override
  int sign(int input, int coin) {
    final func = wasm.getFunction('TWAnySignerSign')!;
    return func([input, coin]).first as int;
  }

  @override
  int signJSON(int input, int key, int coin) {
    final func = wasm.getFunction('TWAnySignerSignJSON')!;
    return func([input, key, coin]).first as int;
  }

  @override
  bool supportsJSON(int coin) {
    final func = wasm.getFunction('TWAnySignerSupportsJSON')!;
    return func([coin]).first as int != 0;
  }
}

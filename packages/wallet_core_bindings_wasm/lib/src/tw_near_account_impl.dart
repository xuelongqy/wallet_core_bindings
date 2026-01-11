part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWNEARAccount].
class TWNEARAccountImpl extends TWNEARAccountInterface {
  final WasmInstance wasm;

  TWNEARAccountImpl(this.wasm);

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWNEARAccountCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWNEARAccountDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWNEARAccountDescription')!;
    return func([pointer]).first as int;
  }
}

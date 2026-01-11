part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWFIOAccount].
class TWFIOAccountImpl extends TWFIOAccountInterface {
  final WasmInstance wasm;

  TWFIOAccountImpl(this.wasm);

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWFIOAccountCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWFIOAccountDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWFIOAccountDescription')!;
    return func([pointer]).first as int;
  }
}

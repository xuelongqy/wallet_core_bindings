part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWDerivationPathIndex].
class TWDerivationPathIndexImpl extends TWDerivationPathIndexInterface {
  final WasmInstance wasm;

  TWDerivationPathIndexImpl(this.wasm);

  @override
  int create(int value, bool hardened) {
    final func = wasm.getFunction('TWDerivationPathIndexCreate')!;
    return func([value, hardened ? 1 : 0]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWDerivationPathIndexDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWDerivationPathIndexDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool hardened(int pointer) {
    final func = wasm.getFunction('TWDerivationPathIndexHardened')!;
    return (func([pointer]).first as int) != 0;
  }

  @override
  int value(int pointer) {
    final func = wasm.getFunction('TWDerivationPathIndexValue')!;
    return func([pointer]).first as int;
  }
}

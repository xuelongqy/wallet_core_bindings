part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWDerivationPath].
class TWDerivationPathImpl extends TWDerivationPathInterface {
  final WasmInstance wasm;

  TWDerivationPathImpl(this.wasm);

  @override
  int account(int pointer) {
    final func = wasm.getFunction('TWDerivationPathAccount')!;
    return func([pointer]).first as int;
  }

  @override
  int address(int pointer) {
    final func = wasm.getFunction('TWDerivationPathAddress')!;
    return func([pointer]).first as int;
  }

  @override
  int change(int pointer) {
    final func = wasm.getFunction('TWDerivationPathChange')!;
    return func([pointer]).first as int;
  }

  @override
  int coin(int pointer) {
    final func = wasm.getFunction('TWDerivationPathCoin')!;
    return func([pointer]).first as int;
  }

  @override
  int create(int purpose, int coin, int account, int change, int address) {
    final func = wasm.getFunction('TWDerivationPathCreate')!;
    return func([purpose, coin, account, change, address]).first as int;
  }

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWDerivationPathCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWDerivationPathDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWDerivationPathDescription')!;
    return func([pointer]).first as int;
  }

  @override
  int indexAt(int pointer, int index) {
    final func = wasm.getFunction('TWDerivationPathIndexAt')!;
    return func([pointer, index]).first as int;
  }

  @override
  int indicesCount(int pointer) {
    final func = wasm.getFunction('TWDerivationPathIndicesCount')!;
    return func([pointer]).first as int;
  }

  @override
  int purpose(int pointer) {
    final func = wasm.getFunction('TWDerivationPathPurpose')!;
    return func([pointer]).first as int;
  }
}

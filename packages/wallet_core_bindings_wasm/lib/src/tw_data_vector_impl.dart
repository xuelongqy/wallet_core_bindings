part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWDataVector].
class TWDataVectorImpl extends TWDataVectorInterface {
  final WasmInstance wasm;

  TWDataVectorImpl(this.wasm);

  @override
  void add(int pointer, int data) {
    final func = wasm.getFunction('TWDataVectorAdd')!;
    func([pointer, data]);
  }

  @override
  int create() {
    final func = wasm.getFunction('TWDataVectorCreate')!;
    return func([]).first as int;
  }

  @override
  int createWithData(int data) {
    final func = wasm.getFunction('TWDataVectorCreateWithData')!;
    return func([data]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWDataVectorDelete')!;
    func([pointer]);
  }

  @override
  int get(int pointer, int index) {
    final func = wasm.getFunction('TWDataVectorGet')!;
    return func([pointer, index]).first as int;
  }

  @override
  int size(int pointer) {
    final func = wasm.getFunction('TWDataVectorSize')!;
    return func([pointer]).first as int;
  }
}

part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWNervosAddress].
class TWNervosAddressImpl extends TWNervosAddressInterface {
  final WasmInstance wasm;

  TWNervosAddressImpl(this.wasm);

  @override
  int args(int pointer) {
    final func = wasm.getFunction('TWNervosAddressArgs')!;
    return func([pointer]).first as int;
  }

  @override
  int codeHash(int pointer) {
    final func = wasm.getFunction('TWNervosAddressCodeHash')!;
    return func([pointer]).first as int;
  }

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWNervosAddressCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWNervosAddressDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWNervosAddressDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWNervosAddressEqual')!;
    return func([lhs, rhs]).first as int != 0;
  }

  @override
  int hashType(int pointer) {
    final func = wasm.getFunction('TWNervosAddressHashType')!;
    return func([pointer]).first as int;
  }

  @override
  bool isValidString(int string) {
    final func = wasm.getFunction('TWNervosAddressIsValidString')!;
    return func([string]).first as int != 0;
  }
}

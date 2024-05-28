part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWSegwitAddress].
class TWSegwitAddressImpl extends TWSegwitAddressInterface {
  final WasmInstance wasm;

  TWSegwitAddressImpl(this.wasm);

  @override
  int createWithPublicKey(int hrp, int publicKey) {
    final func = wasm.getFunction('TWSegwitAddressCreateWithPublicKey')!;
    return func([hrp, publicKey]).first as int;
  }

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWSegwitAddressCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWSegwitAddressDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWSegwitAddressDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWSegwitAddressEqual')!;
    return func([lhs, rhs]).first as int != 0;
  }

  @override
  int hrp(int pointer) {
    final func = wasm.getFunction('TWSegwitAddressHRP')!;
    return func([pointer]).first as int;
  }

  @override
  bool isValidString(int string) {
    final func = wasm.getFunction('TWSegwitAddressIsValidString')!;
    return func([string]).first as int != 0;
  }

  @override
  int witnessProgram(int pointer) {
    final func = wasm.getFunction('TWSegwitAddressWitnessProgram')!;
    return func([pointer]).first as int;
  }

  @override
  int witnessVersion(int pointer) {
    final func = wasm.getFunction('TWSegwitAddressWitnessVersion')!;
    return func([pointer]).first as int;
  }
}

part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWGroestlcoinAddress].
class TWGroestlcoinAddressImpl extends TWGroestlcoinAddressInterface {
  final WasmInstance wasm;

  TWGroestlcoinAddressImpl(this.wasm);

  @override
  int createWithPublicKey(int publicKey, int prefix) {
    final func = wasm.getFunction('TWGroestlcoinAddressCreateWithPublicKey')!;
    return func([publicKey, prefix]).first as int;
  }

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWGroestlcoinAddressCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWGroestlcoinAddressDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWGroestlcoinAddressDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWGroestlcoinAddressEqual')!;
    return func([lhs, rhs]).first as int != 0;
  }

  @override
  bool isValidString(int string) {
    final func = wasm.getFunction('TWGroestlcoinAddressIsValidString')!;
    return func([string]).first as int != 0;
  }
}

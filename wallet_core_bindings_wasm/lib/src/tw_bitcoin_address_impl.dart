part of '../wallet_core_bindings_wasm.dart';

/// Native interface for [TWBitcoinAddress].
class TWBitcoinAddressImpl extends TWBitcoinAddressInterface {
  final WasmInstance wasm;

  TWBitcoinAddressImpl(this.wasm);

  @override
  int createWithData(int data) {
    final func = wasm.getFunction('TWBitcoinAddressCreateWithData')!;
    return func([data]).first as int;
  }

  @override
  int createWithPublicKey(int publicKye, int prefix) {
    final func = wasm.getFunction('TWBitcoinAddressCreateWithPublicKey')!;
    return func([publicKye, prefix]).first as int;
  }

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWBitcoinAddressCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWBitcoinAddressDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWBitcoinAddressDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWBitcoinAddressEqual')!;
    return func([lhs, rhs]).first as int != 0;
  }

  @override
  bool isValid(int data) {
    final func = wasm.getFunction('TWBitcoinAddressIsValid')!;
    return func([data]).first as int != 0;
  }

  @override
  bool isValidString(int string) {
    final func = wasm.getFunction('TWBitcoinAddressIsValidString')!;
    return func([string]).first as int != 0;
  }

  @override
  int keyHash(int pointer) {
    final func = wasm.getFunction('TWBitcoinAddressKeyhash')!;
    return func([pointer]).first as int;
  }

  @override
  int prefix(int pointer) {
    final func = wasm.getFunction('TWBitcoinAddressPrefix')!;
    return func([pointer]).first as int;
  }
}

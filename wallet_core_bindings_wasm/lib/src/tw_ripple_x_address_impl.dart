part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWRippleXAddress].
class TWRippleXAddressImpl extends TWRippleXAddressInterface {
  final WasmInstance wasm;

  TWRippleXAddressImpl(this.wasm);

  @override
  int createWithPublicKey(int publicKey, int tag) {
    final func = wasm.getFunction('TWRippleXAddressCreateWithPublicKey')!;
    return func([publicKey, tag]).first as int;
  }

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWRippleXAddressCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWRippleXAddressDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWRippleXAddressDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWRippleXAddressEqual')!;
    return func([lhs, rhs]).first as int != 0;
  }

  @override
  bool isValidString(int string) {
    final func = wasm.getFunction('TWRippleXAddressIsValidString')!;
    return func([string]).first as int != 0;
  }

  @override
  int tag(int pointer) {
    final func = wasm.getFunction('TWRippleXAddressTag')!;
    return func([pointer]).first as int;
  }
}

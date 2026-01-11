part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWCryptoBoxPublicKey].
class TWCryptoBoxPublicKeyImpl extends TWCryptoBoxPublicKeyInterface {
  final WasmInstance wasm;

  TWCryptoBoxPublicKeyImpl(this.wasm);

  @override
  int createWithData(int data) {
    final func = wasm.getFunction('TWCryptoBoxPublicKeyCreateWithData')!;
    return func([data]).first as int;
  }

  @override
  int date(int pointer) {
    final func = wasm.getFunction('TWCryptoBoxPublicKeyData')!;
    return func([pointer]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWCryptoBoxPublicKeyDelete')!;
    func([pointer]);
  }

  @override
  bool isValid(int data) {
    final func = wasm.getFunction('TWCryptoBoxPublicKeyIsValid')!;
    return func([data]).first == 1;
  }
}

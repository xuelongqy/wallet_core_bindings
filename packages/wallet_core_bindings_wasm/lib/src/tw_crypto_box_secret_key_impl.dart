part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWCryptoBoxSecretKey].
class TWCryptoBoxSecretKeyImpl extends TWCryptoBoxSecretKeyInterface {
  final WasmInstance wasm;

  TWCryptoBoxSecretKeyImpl(this.wasm);

  @override
  int create() {
    final func = wasm.getFunction('TWCryptoBoxSecretKeyCreate')!;
    return func([]).first as int;
  }

  @override
  int createWithData(int data) {
    final func = wasm.getFunction('TWCryptoBoxSecretKeyCreateWithData')!;
    return func([data]).first as int;
  }

  @override
  int date(int pointer) {
    final func = wasm.getFunction('TWCryptoBoxSecretKeyData')!;
    return func([pointer]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWCryptoBoxSecretKeyDelete')!;
    func([pointer]);
  }

  @override
  int getPublicKey(int pointer) {
    final func = wasm.getFunction('TWCryptoBoxSecretKeyGetPublicKey')!;
    return func([pointer]).first as int;
  }

  @override
  bool isValid(int data) {
    final func = wasm.getFunction('TWCryptoBoxSecretKeyIsValid')!;
    return func([data]).first == 1;
  }
}

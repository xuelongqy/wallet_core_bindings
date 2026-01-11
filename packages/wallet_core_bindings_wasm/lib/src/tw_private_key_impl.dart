part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWPrivateKey].
class TWPrivateKeyImpl extends TWPrivateKeyInterface {
  final WasmInstance wasm;

  TWPrivateKeyImpl(this.wasm);

  @override
  int create() {
    final func = wasm.getFunction('TWPrivateKeyCreate')!;
    return func().first as int;
  }

  @override
  int createCopy(int key) {
    final func = wasm.getFunction('TWPrivateKeyCreateCopy')!;
    return func([key]).first as int;
  }

  @override
  int createWithData(int data) {
    final func = wasm.getFunction('TWPrivateKeyCreateWithData')!;
    return func([data]).first as int;
  }

  @override
  int data(int pointer) {
    final func = wasm.getFunction('TWPrivateKeyData')!;
    return func([pointer]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWPrivateKeyDelete')!;
    func([pointer]);
  }

  @override
  int getPublicKey(int pointer, int coinType) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKey')!;
    return func([pointer, coinType]).first as int;
  }

  @override
  int getPublicKeyByType(int pointer, int pubkeyType) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKeyByType')!;
    return func([pointer, pubkeyType]).first as int;
  }

  @override
  int getPublicKeyCurve25519(int pointer) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKeyCurve25519')!;
    return func([pointer]).first as int;
  }

  @override
  int getPublicKeyEd25519(int pointer) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKeyEd25519')!;
    return func([pointer]).first as int;
  }

  @override
  int getPublicKeyEd25519Blake2b(int pointer) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKeyEd25519Blake2b')!;
    return func([pointer]).first as int;
  }

  @override
  int getPublicKeyEd25519Cardano(int pointer) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKeyEd25519Cardano')!;
    return func([pointer]).first as int;
  }

  @override
  int getPublicKeyNist256p1(int pointer) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKeyNist256p1')!;
    return func([pointer]).first as int;
  }

  @override
  int getPublicKeySecp256k1(int pointer, bool compressed) {
    final func = wasm.getFunction('TWPrivateKeyGetPublicKeySecp256k1')!;
    return func([pointer, compressed ? 1 : 0]).first as int;
  }

  @override
  bool isValid(int data, int curve) {
    final func = wasm.getFunction('TWPrivateKeyIsValid')!;
    return func([data, curve]).first as int == 1;
  }

  @override
  int sign(int pointer, int digest, int curve) {
    final func = wasm.getFunction('TWPrivateKeySign')!;
    return func([pointer, digest, curve]).first as int;
  }

  @override
  int signAsDER(int pointer, int digest) {
    final func = wasm.getFunction('TWPrivateKeySignAsDER')!;
    return func([pointer, digest]).first as int;
  }

  @override
  int signZilliqaSchnorr(int pointer, int message) {
    final func = wasm.getFunction('TWPrivateKeySignZilliqaSchnorr')!;
    return func([pointer, message]).first as int;
  }
}

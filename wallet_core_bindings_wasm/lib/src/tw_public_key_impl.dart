part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWPublicKey].
class TWPublicKeyImpl extends TWPublicKeyInterface {
  final WasmInstance wasm;

  TWPublicKeyImpl(this.wasm);

  @override
  int compressed(int from) {
    final func = wasm.getFunction('TWPublicKeyCompressed')!;
    return func([from]).first as int;
  }

  @override
  int createWithData(int data, int type) {
    final func = wasm.getFunction('TWPublicKeyCreateWithData')!;
    return func([data, type]).first as int;
  }

  @override
  int data(int pointer) {
    final func = wasm.getFunction('TWPublicKeyData')!;
    return func([pointer]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWPublicKeyDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWPublicKeyDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool isCompressed(int pointer) {
    final func = wasm.getFunction('TWPublicKeyIsCompressed')!;
    return func([pointer]).first as int == 1;
  }

  @override
  bool isValid(int data, int type) {
    final func = wasm.getFunction('TWPublicKeyIsValid')!;
    return func([data, type]).first as int == 1;
  }

  @override
  int recover(int signature, int message) {
    final func = wasm.getFunction('TWPublicKeyRecover')!;
    try {
      return func([signature, message]).first as int;
    } catch (e, s) {
      debugPrintStack(stackTrace: s, label: e.toString());
      return 0;
    }
  }

  @override
  int type(int pointer) {
    final func = wasm.getFunction('TWPublicKeyKeyType')!;
    return func([pointer]).first as int;
  }

  @override
  int uncompressed(int from) {
    final func = wasm.getFunction('TWPublicKeyUncompressed')!;
    return func([from]).first as int;
  }

  @override
  bool verify(int pointer, int signature, int message) {
    final func = wasm.getFunction('TWPublicKeyVerify')!;
    return func([pointer, signature, message]).first as int == 1;
  }

  @override
  bool verifyAsDER(int pointer, int signature, int message) {
    final func = wasm.getFunction('TWPublicKeyVerifyAsDER')!;
    return func([pointer, signature, message]).first as int == 1;
  }

  @override
  bool verifyZilliqaSchnorr(int pointer, int signature, int message) {
    final func = wasm.getFunction('TWPublicKeyVerifyZilliqaSchnorr')!;
    return func([pointer, signature, message]).first as int == 1;
  }
}

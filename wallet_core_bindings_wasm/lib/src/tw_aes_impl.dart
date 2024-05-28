part of '../wallet_core_bindings_wasm.dart';

/// Native interface for [TWAES].
class TWAESImpl extends TWAESInterface {
  final WasmInstance wasm;

  TWAESImpl(this.wasm);

  @override
  int decryptCBC(int key, int data, int iv, int mode) {
    final func = wasm.getFunction('TWAESDecryptCBC')!;
    return func([key, data, iv, mode]).first as int;
  }

  @override
  int decryptCTR(int key, int data, int iv) {
    final func = wasm.getFunction('TWAESDecryptCTR')!;
    return func([key, data, iv]).first as int;
  }

  @override
  int encryptCBC(int key, int data, int iv, int mode) {
    final func = wasm.getFunction('TWAESEncryptCBC')!;
    return func([key, data, iv, mode]).first as int;
  }

  @override
  int encryptCTR(int key, int data, int iv) {
    final func = wasm.getFunction('TWAESEncryptCTR')!;
    return func([key, data, iv]).first as int;
  }
}

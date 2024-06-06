part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWAES].
class TWAESImpl extends TWAESInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWAESImpl(this.bindings);

  @override
  int decryptCBC(int key, int data, int iv, int mode) {
    return bindings.TWAESDecryptCBC(
      Pointer.fromAddress(key),
      Pointer.fromAddress(data),
      Pointer.fromAddress(iv),
      mode,
    ).address;
  }

  @override
  int decryptCTR(int key, int data, int iv) {
    return bindings.TWAESDecryptCTR(
      Pointer.fromAddress(key),
      Pointer.fromAddress(data),
      Pointer.fromAddress(iv),
    ).address;
  }

  @override
  int encryptCBC(int key, int data, int iv, int mode) {
    return bindings.TWAESEncryptCBC(
      Pointer.fromAddress(key),
      Pointer.fromAddress(data),
      Pointer.fromAddress(iv),
      mode,
    ).address;
  }

  @override
  int encryptCTR(int key, int data, int iv) {
    return bindings.TWAESEncryptCTR(
      Pointer.fromAddress(key),
      Pointer.fromAddress(data),
      Pointer.fromAddress(iv),
    ).address;
  }
}

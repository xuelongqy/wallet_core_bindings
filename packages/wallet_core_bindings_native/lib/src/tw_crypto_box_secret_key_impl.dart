part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWCryptoBoxSecretKey].
class TWCryptoBoxSecretKeyImpl extends TWCryptoBoxSecretKeyInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWCryptoBoxSecretKeyImpl(this.bindings);

  @override
  int create() {
    return bindings.TWCryptoBoxSecretKeyCreate().address;
  }

  @override
  int createWithData(int data) {
    return bindings.TWCryptoBoxSecretKeyCreateWithData(
      Pointer.fromAddress(data),
    ).address;
  }

  @override
  int date(int pointer) {
    return bindings.TWCryptoBoxSecretKeyData(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWCryptoBoxSecretKeyDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int getPublicKey(int pointer) {
    return bindings.TWCryptoBoxSecretKeyGetPublicKey(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool isValid(int data) {
    return bindings.TWCryptoBoxSecretKeyIsValid(
      Pointer.fromAddress(data),
    );
  }
}

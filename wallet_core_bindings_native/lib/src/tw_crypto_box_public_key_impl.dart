part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWCryptoBoxPublicKey].
class TWCryptoBoxPublicKeyImpl extends TWCryptoBoxPublicKeyInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWCryptoBoxPublicKeyImpl(this.bindings);

  @override
  int createWithData(int data) {
    return bindings.TWCryptoBoxPublicKeyCreateWithData(
            Pointer.fromAddress(data))
        .address;
  }

  @override
  int date(int pointer) {
    return bindings.TWCryptoBoxPublicKeyData(Pointer.fromAddress(pointer))
        .address;
  }

  @override
  void delete(int pointer) {
    bindings.TWCryptoBoxPublicKeyDelete(Pointer.fromAddress(pointer));
  }

  @override
  bool isValid(int data) {
    return bindings.TWCryptoBoxPublicKeyIsValid(Pointer.fromAddress(data));
  }
}

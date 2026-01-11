part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWPublicKey].
class TWPublicKeyImpl extends TWPublicKeyInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWPublicKeyImpl(this.bindings);

  @override
  int compressed(int from) {
    return bindings.TWPublicKeyCompressed(Pointer.fromAddress(from)).address;
  }

  @override
  int createWithData(int data, int type) {
    return bindings.TWPublicKeyCreateWithData(Pointer.fromAddress(data), type)
        .address;
  }

  @override
  int data(int pointer) {
    return bindings.TWPublicKeyData(Pointer.fromAddress(pointer)).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWPublicKeyDelete(Pointer.fromAddress(pointer));
  }

  @override
  int description(int pointer) {
    return bindings.TWPublicKeyDescription(Pointer.fromAddress(pointer))
        .address;
  }

  @override
  bool isCompressed(int pointer) {
    return bindings.TWPublicKeyIsCompressed(Pointer.fromAddress(pointer));
  }

  @override
  bool isValid(int data, int type) {
    return bindings.TWPublicKeyIsValid(Pointer.fromAddress(data), type);
  }

  @override
  int recover(int signature, int message) {
    return bindings.TWPublicKeyRecover(
            Pointer.fromAddress(signature), Pointer.fromAddress(message))
        .address;
  }

  @override
  int type(int pointer) {
    return bindings.TWPublicKeyKeyType(Pointer.fromAddress(pointer));
  }

  @override
  int uncompressed(int from) {
    return bindings.TWPublicKeyUncompressed(Pointer.fromAddress(from)).address;
  }

  @override
  bool verify(int pointer, int signature, int message) {
    return bindings.TWPublicKeyVerify(Pointer.fromAddress(pointer),
        Pointer.fromAddress(signature), Pointer.fromAddress(message));
  }

  @override
  bool verifyAsDER(int pointer, int signature, int message) {
    return bindings.TWPublicKeyVerifyAsDER(Pointer.fromAddress(pointer),
        Pointer.fromAddress(signature), Pointer.fromAddress(message));
  }

  @override
  bool verifyZilliqaSchnorr(int pointer, int signature, int message) {
    return bindings.TWPublicKeyVerifyZilliqaSchnorr(
        Pointer.fromAddress(pointer),
        Pointer.fromAddress(signature),
        Pointer.fromAddress(message));
  }
}

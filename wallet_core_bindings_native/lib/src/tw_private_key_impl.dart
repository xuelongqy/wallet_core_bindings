part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWPrivateKey].
class TWPrivateKeyImpl extends TWPrivateKeyInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWPrivateKeyImpl(this.bindings);

  @override
  int create() {
    return bindings.TWPrivateKeyCreate().address;
  }

  @override
  int createCopy(int key) {
    return bindings.TWPrivateKeyCreateCopy(Pointer.fromAddress(key)).address;
  }

  @override
  int createWithData(int data) {
    return bindings.TWPrivateKeyCreateWithData(Pointer.fromAddress(data))
        .address;
  }

  @override
  int data(int pointer) {
    return bindings.TWPrivateKeyData(Pointer.fromAddress(pointer)).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWPrivateKeyDelete(Pointer.fromAddress(pointer));
  }

  @override
  int getPublicKey(int pointer, int coinType) {
    return bindings.TWPrivateKeyGetPublicKey(
            Pointer.fromAddress(pointer), coinType)
        .address;
  }

  @override
  int getPublicKeyByType(int pointer, int pubkeyType) {
    return bindings.TWPrivateKeyGetPublicKeyByType(
            Pointer.fromAddress(pointer), pubkeyType)
        .address;
  }

  @override
  int getPublicKeyCurve25519(int pointer) {
    return bindings.TWPrivateKeyGetPublicKeyCurve25519(
            Pointer.fromAddress(pointer))
        .address;
  }

  @override
  int getPublicKeyEd25519(int pointer) {
    return bindings.TWPrivateKeyGetPublicKeyEd25519(
            Pointer.fromAddress(pointer))
        .address;
  }

  @override
  int getPublicKeyEd25519Blake2b(int pointer) {
    return bindings.TWPrivateKeyGetPublicKeyEd25519Blake2b(
            Pointer.fromAddress(pointer))
        .address;
  }

  @override
  int getPublicKeyEd25519Cardano(int pointer) {
    return bindings.TWPrivateKeyGetPublicKeyEd25519Cardano(
            Pointer.fromAddress(pointer))
        .address;
  }

  @override
  int getPublicKeyNist256p1(int pointer) {
    return bindings.TWPrivateKeyGetPublicKeyNist256p1(
            Pointer.fromAddress(pointer))
        .address;
  }

  @override
  int getPublicKeySecp256k1(int pointer, bool compressed) {
    return bindings.TWPrivateKeyGetPublicKeySecp256k1(
            Pointer.fromAddress(pointer), compressed)
        .address;
  }

  @override
  bool isValid(int data, int curve) {
    return bindings.TWPrivateKeyIsValid(Pointer.fromAddress(data), curve);
  }

  @override
  int sign(int pointer, int digest, int curve) {
    return bindings.TWPrivateKeySign(
            Pointer.fromAddress(pointer), Pointer.fromAddress(digest), curve)
        .address;
  }

  @override
  int signAsDER(int pointer, int digest) {
    return bindings.TWPrivateKeySignAsDER(
            Pointer.fromAddress(pointer), Pointer.fromAddress(digest))
        .address;
  }

  @override
  int signZilliqaSchnorr(int pointer, int message) {
    return bindings.TWPrivateKeySignZilliqaSchnorr(
            Pointer.fromAddress(pointer), Pointer.fromAddress(message))
        .address;
  }
}

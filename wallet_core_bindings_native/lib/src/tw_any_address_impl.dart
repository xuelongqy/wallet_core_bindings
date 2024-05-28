part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWAnyAddress].
class TWAnyAddressImpl extends TWAnyAddressInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWAnyAddressImpl(this.bindings);

  @override
  int coin(int pointer) {
    return bindings.TWAnyAddressCoin(Pointer.fromAddress(pointer));
  }

  @override
  int createBech32(int string, int coin, int hrp) {
    return bindings.TWAnyAddressCreateBech32(
      Pointer.fromAddress(string),
      coin,
      Pointer.fromAddress(hrp),
    ).address;
  }

  @override
  int createBech32WithPublicKey(int publicKey, int coin, int hrp) {
    return bindings.TWAnyAddressCreateBech32WithPublicKey(
      Pointer.fromAddress(publicKey),
      coin,
      Pointer.fromAddress(hrp),
    ).address;
  }

  @override
  int createSS58(int string, int coin, int ss58Prefix) {
    return bindings.TWAnyAddressCreateSS58(
      Pointer.fromAddress(string),
      coin,
      ss58Prefix,
    ).address;
  }

  @override
  int createSS58WithPublicKey(int publicKey, int coin, int ss58Prefix) {
    return bindings.TWAnyAddressCreateSS58WithPublicKey(
      Pointer.fromAddress(publicKey),
      coin,
      ss58Prefix,
    ).address;
  }

  @override
  int createWithPublicKey(int publicKey, int coin) {
    return bindings.TWAnyAddressCreateWithPublicKey(
      Pointer.fromAddress(publicKey),
      coin,
    ).address;
  }

  @override
  int createWithPublicKeyDerivation(int publicKey, int coin, int derivation) {
    return bindings.TWAnyAddressCreateWithPublicKeyDerivation(
      Pointer.fromAddress(publicKey),
      coin,
      derivation,
    ).address;
  }

  @override
  int createWithPublicKeyFilecoinAddressType(
      int publicKey, int filecoinAddressType) {
    return bindings.TWAnyAddressCreateWithPublicKeyFilecoinAddressType(
      Pointer.fromAddress(publicKey),
      filecoinAddressType,
    ).address;
  }

  @override
  int createWithPublicKeyFiroAddressType(int publicKey, int firoAddressType) {
    return bindings.TWAnyAddressCreateWithPublicKeyFiroAddressType(
      Pointer.fromAddress(publicKey),
      firoAddressType,
    ).address;
  }

  @override
  int createWithString(int string, int coin) {
    return bindings.TWAnyAddressCreateWithString(
      Pointer.fromAddress(string),
      coin,
    ).address;
  }

  @override
  int data(int pointer) {
    return bindings.TWAnyAddressData(Pointer.fromAddress(pointer)).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWAnyAddressDelete(Pointer.fromAddress(pointer));
  }

  @override
  int description(int pointer) {
    return bindings.TWAnyAddressDescription(Pointer.fromAddress(pointer))
        .address;
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWAnyAddressEqual(
      Pointer.fromAddress(lhs),
      Pointer.fromAddress(rhs),
    );
  }

  @override
  bool isValid(int string, int coin) {
    return bindings.TWAnyAddressIsValid(
      Pointer.fromAddress(string),
      coin,
    );
  }

  @override
  bool isValidBech32(int string, int coin, int hrp) {
    return bindings.TWAnyAddressIsValidBech32(
      Pointer.fromAddress(string),
      coin,
      Pointer.fromAddress(hrp),
    );
  }

  @override
  bool isValidSS58(int string, int coin, int ss58Prefix) {
    return bindings.TWAnyAddressIsValidSS58(
      Pointer.fromAddress(string),
      coin,
      ss58Prefix,
    );
  }
}

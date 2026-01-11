part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBitcoinAddress].
class TWBitcoinAddressImpl extends TWBitcoinAddressInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBitcoinAddressImpl(this.bindings);

  @override
  int createWithData(int data) {
    return bindings.TWBitcoinAddressCreateWithData(
      Pointer.fromAddress(data),
    ).address;
  }

  @override
  int createWithPublicKey(int publicKye, int prefix) {
    return bindings.TWBitcoinAddressCreateWithPublicKey(
      Pointer.fromAddress(publicKye),
      prefix,
    ).address;
  }

  @override
  int createWithString(int string) {
    return bindings.TWBitcoinAddressCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWBitcoinAddressDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWBitcoinAddressDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWBitcoinAddressEqual(
      Pointer.fromAddress(lhs),
      Pointer.fromAddress(rhs),
    );
  }

  @override
  bool isValid(int data) {
    return bindings.TWBitcoinAddressIsValid(
      Pointer.fromAddress(data),
    );
  }

  @override
  bool isValidString(int string) {
    return bindings.TWBitcoinAddressIsValidString(
      Pointer.fromAddress(string),
    );
  }

  @override
  int keyHash(int pointer) {
    return bindings.TWBitcoinAddressKeyhash(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int prefix(int pointer) {
    return bindings.TWBitcoinAddressPrefix(
      Pointer.fromAddress(pointer),
    );
  }
}

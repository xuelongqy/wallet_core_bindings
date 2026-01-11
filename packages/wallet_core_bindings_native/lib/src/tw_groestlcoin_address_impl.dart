part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWGroestlcoinAddress].
class TWGroestlcoinAddressImpl extends TWGroestlcoinAddressInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWGroestlcoinAddressImpl(this.bindings);

  @override
  int createWithPublicKey(int publicKey, int prefix) {
    return bindings.TWGroestlcoinAddressCreateWithPublicKey(
      Pointer.fromAddress(publicKey),
      prefix,
    ).address;
  }

  @override
  int createWithString(int string) {
    return bindings.TWGroestlcoinAddressCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWGroestlcoinAddressDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWGroestlcoinAddressDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWGroestlcoinAddressEqual(
      Pointer.fromAddress(lhs),
      Pointer.fromAddress(rhs),
    );
  }

  @override
  bool isValidString(int string) {
    return bindings.TWGroestlcoinAddressIsValidString(
      Pointer.fromAddress(string),
    );
  }
}

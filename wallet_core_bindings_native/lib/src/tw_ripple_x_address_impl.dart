part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWRippleXAddress].
class TWRippleXAddressImpl extends TWRippleXAddressInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWRippleXAddressImpl(this.bindings);

  @override
  int createWithPublicKey(int publicKey, int tag) {
    return bindings.TWRippleXAddressCreateWithPublicKey(
      Pointer.fromAddress(publicKey),
      tag,
    ).address;
  }

  @override
  int createWithString(int string) {
    return bindings.TWRippleXAddressCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWRippleXAddressDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWRippleXAddressDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWRippleXAddressEqual(
      Pointer.fromAddress(lhs),
      Pointer.fromAddress(rhs),
    );
  }

  @override
  bool isValidString(int string) {
    return bindings.TWRippleXAddressIsValidString(
      Pointer.fromAddress(string),
    );
  }

  @override
  int tag(int pointer) {
    return bindings.TWRippleXAddressTag(
      Pointer.fromAddress(pointer),
    );
  }
}

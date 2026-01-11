part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWSegwitAddress].
class TWSegwitAddressImpl extends TWSegwitAddressInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWSegwitAddressImpl(this.bindings);

  @override
  int createWithPublicKey(int hrp, int publicKey) {
    return bindings.TWSegwitAddressCreateWithPublicKey(
      hrp,
      Pointer.fromAddress(publicKey),
    ).address;
  }

  @override
  int createWithString(int string) {
    return bindings.TWSegwitAddressCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWSegwitAddressDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWSegwitAddressDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWSegwitAddressEqual(
      Pointer.fromAddress(lhs),
      Pointer.fromAddress(rhs),
    );
  }

  @override
  int hrp(int pointer) {
    return bindings.TWSegwitAddressHRP(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  bool isValidString(int string) {
    return bindings.TWSegwitAddressIsValidString(
      Pointer.fromAddress(string),
    );
  }

  @override
  int witnessProgram(int pointer) {
    return bindings.TWSegwitAddressWitnessProgram(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int witnessVersion(int pointer) {
    return bindings.TWSegwitAddressWitnessVersion(
      Pointer.fromAddress(pointer),
    );
  }
}

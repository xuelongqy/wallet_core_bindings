part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWNervosAddress].
class TWNervosAddressImpl extends TWNervosAddressInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWNervosAddressImpl(this.bindings);

  @override
  int args(int pointer) {
    return bindings.TWNervosAddressArgs(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int codeHash(int pointer) {
    return bindings.TWNervosAddressCodeHash(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int createWithString(int string) {
    return bindings.TWNervosAddressCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWNervosAddressDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWNervosAddressDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWNervosAddressEqual(
      Pointer.fromAddress(lhs),
      Pointer.fromAddress(rhs),
    );
  }

  @override
  int hashType(int pointer) {
    return bindings.TWNervosAddressHashType(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool isValidString(int string) {
    return bindings.TWNervosAddressIsValidString(
      Pointer.fromAddress(string),
    );
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWFIOAccount].
class TWFIOAccountImpl extends TWFIOAccountInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWFIOAccountImpl(this.bindings);

  @override
  int createWithString(int string) {
    return bindings.TWFIOAccountCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWFIOAccountDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWFIOAccountDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }
}

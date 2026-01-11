part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWNEARAccount].
class TWNEARAccountImpl extends TWNEARAccountInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWNEARAccountImpl(this.bindings);

  @override
  int createWithString(int string) {
    return bindings.TWNEARAccountCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWNEARAccountDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWNEARAccountDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWStarkWare].
class TWStarkWareImpl extends TWStarkWareInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWStarkWareImpl(this.bindings);

  @override
  int getStarkKeyFromSignature(int derivationPath, int signature) {
    return bindings.TWStarkWareGetStarkKeyFromSignature(
      Pointer.fromAddress(derivationPath),
      Pointer.fromAddress(signature),
    ).address;
  }
}

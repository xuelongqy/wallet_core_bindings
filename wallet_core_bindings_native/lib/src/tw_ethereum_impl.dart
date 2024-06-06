part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWEthereum].
class TWEthereumImpl extends TWEthereumInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEthereumImpl(this.bindings);

  @override
  int eip2645GetPath(int ethAddress, int layer, int application, int index) {
    return bindings.TWEthereumEip2645GetPath(
      Pointer.fromAddress(ethAddress),
      Pointer.fromAddress(layer),
      Pointer.fromAddress(application),
      Pointer.fromAddress(index),
    ).address;
  }
}

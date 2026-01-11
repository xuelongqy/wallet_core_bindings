part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTHORChainSwap].
class TWTHORChainSwapImpl extends TWTHORChainSwapInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTHORChainSwapImpl(this.bindings);

  @override
  int buildSwap(int input) {
    return bindings.TWTHORChainSwapBuildSwap(
      Pointer.fromAddress(input),
    ).address;
  }
}

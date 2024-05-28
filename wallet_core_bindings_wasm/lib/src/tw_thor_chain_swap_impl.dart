part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTHORChainSwap].
class TWTHORChainSwapImpl extends TWTHORChainSwapInterface {
  final WasmInstance wasm;

  TWTHORChainSwapImpl(this.wasm);

  @override
  int buildSwap(int input) {
    final func = wasm.getFunction('TWTHORChainSwapBuildSwap')!;
    return func([input]).first as int;
  }
}

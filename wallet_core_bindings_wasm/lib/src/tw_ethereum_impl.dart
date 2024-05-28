part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWEthereum].
class TWEthereumImpl extends TWEthereumInterface {
  final WasmInstance wasm;

  TWEthereumImpl(this.wasm);

  @override
  int eip2645GetPath(int ethAddress, int layer, int application, int index) {
    final func = wasm.getFunction('TWEthereumEip2645GetPath')!;
    return func([ethAddress, layer, application, index]).first as int;
  }
}

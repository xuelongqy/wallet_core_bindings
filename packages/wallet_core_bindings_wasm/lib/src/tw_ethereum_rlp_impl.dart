part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWEthereumRlp].
class TWEthereumRlpImpl extends TWEthereumRlpInterface {
  final WasmInstance wasm;

  TWEthereumRlpImpl(this.wasm);

  @override
  int encode(int coin, int input) {
    final func = wasm.getFunction('TWEthereumRlpEncode')!;
    return func([coin, input]).first as int;
  }
}

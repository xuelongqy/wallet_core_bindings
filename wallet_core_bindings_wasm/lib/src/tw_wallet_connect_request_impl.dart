part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWWalletConnectRequest].
class TWWalletConnectRequestImpl extends TWWalletConnectRequestInterface {
  final WasmInstance wasm;

  TWWalletConnectRequestImpl(this.wasm);

  @override
  int parse(int coin, int input) {
    final func = wasm.getFunction('TWWalletConnectRequestParse')!;
    return func([coin, input]).first as int;
  }
}

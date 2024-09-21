part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTransactionUtil].
class TWTransactionUtilImpl extends TWTransactionUtilInterface {
  final WasmInstance wasm;

  TWTransactionUtilImpl(this.wasm);

  @override
  int calcTxHash(int coinType, int encodedTx) {
    final func = wasm.getFunction('TWTransactionUtilCalcTxHash')!;
    return func([coinType, encodedTx]).first as int;
  }
}

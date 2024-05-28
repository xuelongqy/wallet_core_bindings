part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWSolanaTransaction].
class TWSolanaTransactionImpl extends TWSolanaTransactionInterface {
  final WasmInstance wasm;

  TWSolanaTransactionImpl(this.wasm);

  @override
  int updateBlockhashAndSign(
      int encodedTx, int recentBlockhash, int privateKeys) {
    final func = wasm.getFunction('TWSolanaTransactionUpdateBlockhashAndSign')!;
    return func([encodedTx, recentBlockhash, privateKeys]).first as int;
  }
}

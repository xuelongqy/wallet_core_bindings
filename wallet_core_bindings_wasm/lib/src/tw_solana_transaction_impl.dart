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

  @override
  int getComputeUnitPrice(int encodedTx) {
    final func = wasm.getFunction('TWSolanaTransactionGetComputeUnitPrice')!;
    return func([encodedTx]).first as int;
  }

  @override
  int setComputeUnitLimit(int encodedTx, int limit) {
    final func = wasm.getFunction('TWSolanaTransactionSetComputeUnitLimit')!;
    return func([encodedTx, limit]).first as int;
  }

  @override
  int setComputeUnitPrice(int encodedTx, int price) {
    final func = wasm.getFunction('TWSolanaTransactionSetComputeUnitPrice')!;
    return func([encodedTx, price]).first as int;
  }

  @override
  int getComputeUnitLimit(int encodedTx) {
    final func = wasm.getFunction('TWSolanaTransactionGetComputeUnitLimit')!;
    return func([encodedTx]).first as int;
  }

  @override
  int setFeePayer(int encodedTx, int feePayer) {
    final func = wasm.getFunction('TWSolanaTransactionSetFeePayer')!;
    return func([encodedTx, feePayer]).first as int;
  }

  @override
  int insertInstruction(int encodedTx, int insertAt, int instruction) {
    final func = wasm.getFunction('TWSolanaTransactionInsertInstruction')!;
    return func([encodedTx, insertAt, instruction]).first as int;
  }
}

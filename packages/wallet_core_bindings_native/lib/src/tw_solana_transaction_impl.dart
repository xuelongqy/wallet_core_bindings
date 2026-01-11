part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWSolanaTransaction].
class TWSolanaTransactionImpl extends TWSolanaTransactionInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWSolanaTransactionImpl(this.bindings);

  @override
  int updateBlockhashAndSign(
      int encodedTx, int recentBlockhash, int privateKeys) {
    return bindings.TWSolanaTransactionUpdateBlockhashAndSign(
      Pointer.fromAddress(encodedTx),
      Pointer.fromAddress(recentBlockhash),
      Pointer.fromAddress(privateKeys),
    ).address;
  }

  @override
  int getComputeUnitPrice(int encodedTx) {
    return bindings.TWSolanaTransactionGetComputeUnitPrice(
      Pointer.fromAddress(encodedTx),
    ).address;
  }

  @override
  int setComputeUnitLimit(int encodedTx, int limit) {
    return bindings.TWSolanaTransactionSetComputeUnitLimit(
      Pointer.fromAddress(encodedTx),
      Pointer.fromAddress(limit),
    ).address;
  }

  @override
  int setComputeUnitPrice(int encodedTx, int price) {
    return bindings.TWSolanaTransactionSetComputeUnitPrice(
      Pointer.fromAddress(encodedTx),
      Pointer.fromAddress(price),
    ).address;
  }

  @override
  int getComputeUnitLimit(int encodedTx) {
    return bindings.TWSolanaTransactionGetComputeUnitLimit(
      Pointer.fromAddress(encodedTx),
    ).address;
  }

  @override
  int setFeePayer(int encodedTx, int feePayer) {
    return bindings.TWSolanaTransactionSetFeePayer(
      Pointer.fromAddress(encodedTx),
      Pointer.fromAddress(feePayer),
    ).address;
  }

  @override
  int insertInstruction(int encodedTx, int insertAt, int instruction) {
    return bindings.TWSolanaTransactionInsertInstruction(
      Pointer.fromAddress(encodedTx),
      insertAt,
      Pointer.fromAddress(instruction),
    ).address;
  }

  @override
  int insertTransferInstruction(
      int encodedTx, int insertAt, int from, int to, int lamports) {
    return bindings.TWSolanaTransactionInsertTransferInstruction(
      Pointer.fromAddress(encodedTx),
      insertAt,
      Pointer.fromAddress(from),
      Pointer.fromAddress(to),
      Pointer.fromAddress(lamports),
    ).address;
  }
}

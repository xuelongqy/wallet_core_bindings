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
}

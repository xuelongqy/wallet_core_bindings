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
}

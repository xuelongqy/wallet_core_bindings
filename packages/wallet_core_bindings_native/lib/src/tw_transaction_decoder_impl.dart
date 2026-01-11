part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTransactionDecoder].
class TWTransactionDecoderImpl extends TWTransactionDecoderInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTransactionDecoderImpl(this.bindings);

  @override
  int decode(int coin, int encodedTx) {
    return bindings.TWTransactionDecoderDecode(
            coin, Pointer.fromAddress(encodedTx))
        .address;
  }
}

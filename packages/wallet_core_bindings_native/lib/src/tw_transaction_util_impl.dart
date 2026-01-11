part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTransactionUtil].
class TWTransactionUtilImpl extends TWTransactionUtilInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTransactionUtilImpl(this.bindings);

  @override
  int calcTxHash(int coinType, int encodedTx) {
    return bindings.TWTransactionUtilCalcTxHash(
            coinType, Pointer.fromAddress(encodedTx))
        .address;
  }
}

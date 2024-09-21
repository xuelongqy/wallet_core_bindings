part of '../wallet_core_bindings.dart';

class TWTransactionUtil {
  /// Calculate the TX hash of a transaction.
  ///
  /// \param [coin] coin type.
  /// \param [encodedTx] encoded transaction data.
  /// \return The TX hash of a transaction, If the input is invalid or the chain is unsupported, null is returned.
  static String? calcTxHash(TWCoinType coinType, String encodedTx) {
    return TWString.fromPointer(_transactionUtilImpl.calcTxHash(
      coinType.coin,
      TWString(encodedTx).pointer,
    )).value;
  }
}

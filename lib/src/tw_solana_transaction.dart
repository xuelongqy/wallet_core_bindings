part of '../wallet_core_bindings.dart';

class TWSolanaTransaction {
  /// Decode Solana transaction, update the recent blockhash and re-sign the transaction.
  ///
  /// # Warning
  ///
  /// This is a temporary solution. It will be removed when `Solana.proto` supports
  /// direct transaction signing.
  ///
  /// \param [encodedTx] base64 encoded Solana transaction.
  /// \param [recentBlockhash] base58 encoded recent blockhash.
  /// \param [privateKeys] list of private keys that should be used to re-sign the transaction.
  /// \return serialized `Solana::Proto::SigningOutput`.
  static Uint8List updateBlockhashAndSign({
    required String encodedTx,
    required String recentBlockhash,
    required TWDataVector privateKeys,
  }) =>
      TWData.fromPointer(iTWBindings.TWSolanaTransactionUpdateBlockhashAndSign(
        TWString(encodedTx).pointer,
        TWString(recentBlockhash).pointer,
        privateKeys.pointer,
      )).bytes()!;
}

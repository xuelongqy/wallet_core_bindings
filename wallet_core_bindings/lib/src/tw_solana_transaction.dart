part of '../wallet_core_bindings.dart';

class TWSolanaTransaction {
  TWSolanaTransaction._();

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
    required List<Uint8List> privateKeys,
  }) =>
      TWData.fromPointer(_solanaTransactionImpl.updateBlockhashAndSign(
        TWString(encodedTx).pointer,
        TWString(recentBlockhash).pointer,
        TWDataVector.createWithDataList(privateKeys).pointer,
      )).bytes()!;

  /// Try to find a `ComputeBudgetInstruction::SetComputeUnitPrice` instruction in the given transaction,
  /// and returns the specified Unit Price.
  ///
  /// \param [encodedTx] base64 encoded Solana transaction.
  /// \return nullable Unit Price as a decimal string. Null if no instruction found.
  static String? getComputeUnitPrice(String encodedTx) =>
      TWString.fromPointer(_solanaTransactionImpl
              .getComputeUnitPrice(TWString(encodedTx).pointer))
          .value;

  /// Try to find a `ComputeBudgetInstruction::SetComputeUnitLimit` instruction in the given transaction,
  /// and returns the specified Unit Limit.
  ///
  /// \param [encodedTx] base64 encoded Solana transaction.
  /// \return nullable Unit Limit as a decimal string. Null if no instruction found.
  static String? getComputeUnitLimit(String encodedTx) =>
      TWString.fromPointer(_solanaTransactionImpl
              .getComputeUnitLimit(TWString(encodedTx).pointer))
          .value;

  /// Adds or updates a `ComputeBudgetInstruction::SetComputeUnitPrice` instruction of the given transaction,
  /// and returns the updated transaction.
  ///
  /// \param [encodedTx] base64 encoded Solana transaction.
  /// \param [price] Unit Price as a decimal string.
  /// \return base64 encoded Solana transaction. Null if an error occurred.
  static String? setComputeUnitPrice(String encodedTx, String price) =>
      TWString.fromPointer(_solanaTransactionImpl.setComputeUnitPrice(
              TWString(encodedTx).pointer, TWString(price).pointer))
          .value;

  /// Adds or updates a `ComputeBudgetInstruction::SetComputeUnitLimit` instruction of the given transaction,
  /// and returns the updated transaction.
  ///
  /// \param [encodedTx] base64 encoded Solana transaction.
  /// \param [limit] Unit Limit as a decimal string.
  /// \return base64 encoded Solana transaction. Null if an error occurred.
  static String? setComputeUnitLimit(String encodedTx, String limit) =>
      TWString.fromPointer(_solanaTransactionImpl.setComputeUnitLimit(
              TWString(encodedTx).pointer, TWString(limit).pointer))
          .value;

  /// Adds fee payer to the given transaction and returns the updated transaction.
  ///
  /// \param [encodedTx] base64 encoded Solana transaction.
  /// \param [feePayer] fee payer account address. Must be a base58 encoded public key. It must NOT be in the account list yet.
  /// \return base64 encoded Solana transaction. Null if an error occurred.
  static String? setFeePayer(String encodedTx, String feePayer) =>
      TWString.fromPointer(_solanaTransactionImpl.setFeePayer(
              TWString(encodedTx).pointer, TWString(feePayer).pointer))
          .value;

  /// Inserts an instruction to the given transaction at the specified position, returning the updated transaction.
  ///
  /// \param [encoded_tx] base64 encoded Solana transaction.
  /// \param [insert_at] index where the instruction should be inserted. If you don't care about the position, use -1.
  /// \param [instruction] json encoded instruction. Here is an example: {"programId":"11111111111111111111111111111111","accounts":[{"pubkey":"YUz1AupPEy1vttBeDS7sXYZFhQJppcXMzjDiDx18Srf","isSigner":true,"isWritable":true},{"pubkey":"d8DiHEeHKdXkM2ZupT86mrvavhmJwUZjHPCzMiB5Lqb","isSigner":false,"isWritable":true}],"data":"3Bxs4Z6oyhaczjLK"}
  /// \return base64 encoded Solana transaction. Null if an error occurred.
  static String? insertInstruction({
    required String encodedTx,
    required int insertAt,
    required String instruction,
  }) =>
      TWString.fromPointer(_solanaTransactionImpl.insertInstruction(
              TWString(encodedTx).pointer,
              insertAt,
              TWString(instruction).pointer))
          .value;

  /// Inserts a SOL transfer instruction to the given transaction at the specified position, returning the updated transaction.
  /// Please note that compute price and limit instructions should always be the first instructions if they are present in the transaction.
  ///
  /// \param [encoded_tx] base64 encoded Solana transaction.
  /// \param [insert_at] index where the instruction should be inserted. If you don't care about the position, use -1.
  /// \param [from] sender account from which the lamports will be debited.
  /// \param [to] receiver account to which the lamports will be transferred.
  /// \param [lamports] amount of lamports to transfer, as a decimal string.
  /// \return base64 encoded Solana transaction. Null if an error occurred.
  static String? insertTransferInstruction({
    required String encodedTx,
    required int insertAt,
    required String from,
    required String to,
    required String lamports,
  }) =>
      TWString.fromPointer(_solanaTransactionImpl.insertTransferInstruction(
              TWString(encodedTx).pointer,
              insertAt,
              TWString(from).pointer,
              TWString(to).pointer,
              TWString(lamports).pointer))
          .value;
}

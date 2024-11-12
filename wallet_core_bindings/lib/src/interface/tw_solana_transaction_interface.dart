part of '../../wallet_core_bindings.dart';

/// [TWSolanaTransaction] interface.
abstract class TWSolanaTransactionInterface {
  int updateBlockhashAndSign(
      int encodedTx, int recentBlockhash, int privateKeys);

  int getComputeUnitPrice(int encodedTx);

  int getComputeUnitLimit(int encodedTx);

  int setComputeUnitPrice(int encodedTx, int price);

  int setComputeUnitLimit(int encodedTx, int limit);
}

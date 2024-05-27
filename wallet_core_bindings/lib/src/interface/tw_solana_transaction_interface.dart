part of '../../wallet_core_bindings.dart';

/// [TWSolanaTransaction] interface.
abstract class TWSolanaTransactionInterface {
  int updateBlockhashAndSign(
      int encodedTx, int recentBlockhash, int privateKeys);
}

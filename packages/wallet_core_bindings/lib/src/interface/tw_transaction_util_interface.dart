part of '../../wallet_core_bindings.dart';

/// [TWTransactionUtil] interface.
abstract class TWTransactionUtilInterface {
  int calcTxHash(int coinType, int encodedTx);
}

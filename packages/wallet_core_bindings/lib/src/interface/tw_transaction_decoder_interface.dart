part of '../../wallet_core_bindings.dart';

/// [TWTransactionDecoder] interface.
abstract class TWTransactionDecoderInterface {
  int decode(int coin, int encodedTx);
}

part of '../../wallet_core_bindings.dart';

/// [TWBitcoinMessageSigner] interface.
abstract class TWBitcoinMessageSignerInterface {
  int signMessage(int privateKey, int address, int message);

  bool verifyMessage(int address, int message, int signature);
}

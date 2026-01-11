part of '../../wallet_core_bindings.dart';

/// [TWTronMessageSigner] interface.
abstract class TWTronMessageSignerInterface {
  int signMessage(int privateKey, int message);

  bool verifyMessage(int pubKey, int message, int signature);
}

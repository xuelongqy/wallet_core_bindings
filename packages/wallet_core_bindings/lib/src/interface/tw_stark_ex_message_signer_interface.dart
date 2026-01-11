part of '../../wallet_core_bindings.dart';

/// [TWStarkExMessageSigner] interface.
abstract class TWStarkExMessageSignerInterface {
  int signMessage(int privateKey, int message);

  bool verifyMessage(int publicKey, int message, int signature);
}

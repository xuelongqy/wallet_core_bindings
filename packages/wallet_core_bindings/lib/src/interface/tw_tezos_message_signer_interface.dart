part of '../../wallet_core_bindings.dart';

/// [TWTezosMessageSigner] interface.
abstract class TWTezosMessageSignerInterface {
  int formatMessage(int message, int url);

  int inputToPayload(int message);

  /// Returns the signature string's address, or `0` for invalid input.
  int signMessage(int privateKey, int message);

  bool verifyMessage(int pubKey, int message, int signature);
}

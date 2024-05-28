part of '../../wallet_core_bindings.dart';

/// [TWWebAuthn] interface.
abstract class TWWebAuthnInterface {
  int getPublicKey(int attestationObject);

  int getRSValues(int signature);

  int reconstructOriginalMessage(int authenticatorData, int clientDataJSON);
}

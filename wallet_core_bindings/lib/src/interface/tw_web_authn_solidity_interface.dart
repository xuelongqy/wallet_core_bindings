part of '../../wallet_core_bindings.dart';

/// [TWWebAuthnSolidity] interface.
abstract class TWWebAuthnSolidityInterface {
  /// Computes WebAuthn message hash to be signed with secp256p1 private key.
  ///
  /// \param authenticatorData The authenticator data in hex format.
  /// \param clientDataJson The client data JSON string with a challenge.
  /// \return WebAuthn message hash.
  int getMessageHash(int authenticatorData, int clientDataJson);

  /// Converts the original ASN-encoded signature from webauthn to the format accepted by Barz
  ///
  /// \param authenticatorData The authenticator data in hex format.
  /// \param clientDataJson The client data JSON string with a challenge.
  /// \param derSignature original ASN-encoded signature from webauthn.
  /// \return WebAuthn ABI-encoded data.
  int getFormattedSignature(
      int authenticatorData, int clientDataJson, int derSignature);
}

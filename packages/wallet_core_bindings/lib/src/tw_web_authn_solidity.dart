part of '../wallet_core_bindings.dart';

/// WebAuthn Solidity functions
class TWWebAuthnSolidity {
  TWWebAuthnSolidity._();

  /// Computes WebAuthn message hash to be signed with secp256p1 private key.
  ///
  /// \param [authenticatorData] The authenticator data in hex format.
  /// \param [clientDataJson] The client data JSON string with a challenge.
  /// \return WebAuthn message hash.
  static Uint8List? getMessageHash({
    required String authenticatorData,
    required String clientDataJson,
  }) =>
      TWData.fromPointer(_webAuthnSolidityImpl.getMessageHash(
        TWString(authenticatorData).pointer,
        TWString(clientDataJson).pointer,
      )).bytes();

  /// Converts the original ASN-encoded signature from webauthn to the format accepted by Barz
  ///
  /// \param [authenticatorData] The authenticator data in hex format.
  /// \param [clientDataJson] The client data JSON string with a challenge.
  /// \param [derSignature] original ASN-encoded signature from webauthn.
  /// \return WebAuthn ABI-encoded data.
  static Uint8List? getFormattedSignature({
    required String authenticatorData,
    required String clientDataJson,
    required Uint8List derSignature,
  }) =>
      TWData.fromPointer(_webAuthnSolidityImpl.getFormattedSignature(
        TWString(authenticatorData).pointer,
        TWString(clientDataJson).pointer,
        TWData(derSignature).pointer,
      )).bytes();
}

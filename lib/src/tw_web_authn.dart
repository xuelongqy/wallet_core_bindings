part of '../wallet_core_bindings.dart';

class TWWebAuthn {
  TWWebAuthn._();

  /// Converts attestation object to the public key on P256 curve
  ///
  /// \param attestationObject Attestation object retrieved from webuthn.get method
  /// \return Public key.
  static TWPublicKey getPublicKey(Uint8List attestationObject) =>
      TWPublicKey.fromPointer(
        iTWBindings.TWWebAuthnGetPublicKey(
          TWData(attestationObject).pointer,
        ),
      );

  /// Uses ASN parser to extract r and s values from a webauthn signature
  ///
  /// \param [signature] ASN encoded webauthn signature: https://www.w3.org/TR/webauthn-2/#sctn-signature-attestation-types
  /// \return Concatenated r and s values.
  static Uint8List getRSValues(Uint8List signature) => TWData.fromPointer(
        iTWBindings.TWWebAuthnGetRSValues(
          TWData(signature).pointer,
        ),
      ).bytes()!;

  /// Reconstructs the original message that was signed via P256 curve. Can be used for signature validation.
  ///
  /// \param [authenticatorData] Authenticator Data: https://www.w3.org/TR/webauthn-2/#authenticator-data
  /// \param [clientDataJSON] clientDataJSON: https://www.w3.org/TR/webauthn-2/#dom-authenticatorresponse-clientdatajson
  /// \return original messages.
  static Uint8List reconstructOriginalMessage(
          Uint8List authenticatorData, Uint8List clientDataJSON) =>
      TWData.fromPointer(
        iTWBindings.TWWebAuthnReconstructOriginalMessage(
          TWData(authenticatorData).pointer,
          TWData(clientDataJSON).pointer,
        ),
      ).bytes()!;
}

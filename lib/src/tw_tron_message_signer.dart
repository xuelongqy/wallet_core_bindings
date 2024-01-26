part of '../wallet_core_bindings.dart';

/// Tron message signing and verification.
///
/// Tron and some other wallets support a message signing & verification format, to create a proof (a signature)
/// that someone has access to the private keys of a specific address.
class TWTronMessageSigner {
  /// Sign a message.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [message] A custom message which is input to the signing.
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned. Returned object needs to be deleted after use.
  String? signMessage(TWPrivateKey privateKey, String message) =>
      TWString.fromPointer(
        iTWBindings.TWTronMessageSignerSignMessage(
          privateKey.pointer,
          TWString(message).pointer,
        ),
      ).value;

  /// Verify signature for a message.
  ///
  /// \param [pubKey] pubKey that will verify and recover the message from the signature
  /// \param [message] the message signed (without prefix)
  /// \param [signature] in Hex-encoded form.
  /// \returns false on any invalid input (does not throw), true if the message can be recovered from the signature
  bool verifyMessage(TWPublicKey pubKey, String message, String signature) =>
      iTWBindings.TWTronMessageSignerVerifyMessage(
        pubKey.pointer,
        TWString(message).pointer,
        TWString(signature).pointer,
      );
}

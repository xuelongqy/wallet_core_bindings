part of '../wallet_core_bindings.dart';

/// StarkEx message signing and verification.
///
/// StarkEx and some other wallets support a message signing & verification format, to create a proof (a signature)
/// that someone has access to the private keys of a specific address.
class TWStarkExMessageSigner {
  TWStarkExMessageSigner._();

  /// Sign a message.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [message] A custom hex message which is input to the signing.
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned. Returned object needs to be deleted after use.
  static String signMessage(TWPrivateKey privateKey, String message) =>
      TWString.fromPointer(
        _starkExMessageSignerImpl.signMessage(
          privateKey.pointer,
          TWString(message).pointer,
        ),
      ).value!;

  /// Verify signature for a message.
  ///
  /// \param [pubKey] pubKey that will verify and recover the message from the signature
  /// \param [message] the message signed (without prefix) in hex
  /// \param [signature] in Hex-encoded form.
  /// \returns false on any invalid input (does not throw), true if the message can be recovered from the signature
  static bool verifyMessage({
    required TWPublicKey publicKey,
    required String message,
    required String signature,
  }) =>
      _starkExMessageSignerImpl.verifyMessage(
        publicKey.pointer,
        TWString(message).pointer,
        TWString(signature).pointer,
      );
}

part of '../wallet_core_bindings.dart';

/// TON message signing.
class TWTONMessageSigner {
  TWTONMessageSigner._();

  /// Signs an arbitrary message to prove ownership of an address for off-chain services.
  /// https://github.com/ton-foundation/specs/blob/main/specs/wtf-0002.md
  ///
  /// \param [privateKey]: the private key used for signing
  /// \param [message]: A custom message which is input to the signing.
  /// \returns the signature, Hex-encoded. On invalid input null is returned. Returned object needs to be deleted after use.
  static String? signMessage(TWPrivateKey privateKey, String message) {
    return TWString.fromPointer(_tonMessageSignerImpl.signMessage(
      privateKey.pointer,
      TWString(message).pointer,
    )).value;
  }
}

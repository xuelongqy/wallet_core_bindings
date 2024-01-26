part of '../wallet_core_bindings.dart';

/// Ethereum message signing and verification.
///
/// Ethereum and some other wallets support a message signing & verification format, to create a proof (a signature)
/// that someone has access to the private keys of a specific address.
class TWEthereumMessageSigner {
  /// Sign a typed message EIP-712 V4.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [messageJson] A custom typed data message in json
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned. Returned object needs to be deleted after use.
  static String signTypedMessage(TWPrivateKey privateKey, String messageJson) =>
      TWString.fromPointer(
        iTWBindings.TWEthereumMessageSignerSignTypedMessage(
          privateKey.pointer,
          TWString(messageJson).pointer,
        ),
      ).value!;

  /// Sign a typed message EIP-712 V4 with EIP-155 replay attack protection.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [messageJson] A custom typed data message in json
  /// \param [chainId] chainId for eip-155 protection
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned or invalid chainId error message. Returned object needs to be deleted after use.
  static String signTypedMessageEip155(
          TWPrivateKey privateKey, String messageJson, int chainId) =>
      TWString.fromPointer(
        iTWBindings.TWEthereumMessageSignerSignTypedMessageEip155(
          privateKey.pointer,
          TWString(messageJson).pointer,
          chainId,
        ),
      ).value!;

  /// Sign a message.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [message] A custom message which is input to the signing.
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned. Returned object needs to be deleted after use.
  static String signMessage(TWPrivateKey privateKey, String message) =>
      TWString.fromPointer(
        iTWBindings.TWEthereumMessageSignerSignMessage(
          privateKey.pointer,
          TWString(message).pointer,
        ),
      ).value!;

  /// Sign a message with Immutable X msg type.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [message] A custom message which is input to the signing.
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned. Returned object needs to be deleted after use.
  static String signMessageImmutableX(
          TWPrivateKey privateKey, String message) =>
      TWString.fromPointer(
        iTWBindings.TWEthereumMessageSignerSignMessageImmutableX(
          privateKey.pointer,
          TWString(message).pointer,
        ),
      ).value!;

  /// Sign a message with Eip-155 msg type.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [message] A custom message which is input to the signing.
  /// \param [chainId] chainId for eip-155 protection
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned. Returned object needs to be deleted after use.
  static String signMessageEip155(
          TWPrivateKey privateKey, String message, int chainId) =>
      TWString.fromPointer(
        iTWBindings.TWEthereumMessageSignerSignMessageEip155(
          privateKey.pointer,
          TWString(message).pointer,
          chainId,
        ),
      ).value!;

  /// Verify signature for a message.
  ///
  /// \param [pubKey] pubKey that will verify and recover the message from the signature
  /// \param [message] the message signed (without prefix)
  /// \param [signature] in Hex-encoded form.
  /// \returns false on any invalid input (does not throw), true if the message can be recovered from the signature
  static bool verifyMessage(
          TWPublicKey pubKey, String message, String signature) =>
      iTWBindings.TWEthereumMessageSignerVerifyMessage(
        pubKey.pointer,
        TWString(message).pointer,
        TWString(signature).pointer,
      );
}

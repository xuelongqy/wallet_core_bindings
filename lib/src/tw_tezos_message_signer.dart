part of '../wallet_core_bindings.dart';

/// Tezos message signing, verification and utilities.
class TWTezosMessageSigner {
  /// Implement format input as described in https://tezostaquito.io/docs/signing/
  ///
  /// \param [message] message to format e.g: Hello, World
  /// \param [url] the app url, e.g: testUrl
  /// \returns the formatted message as a string
  String formatMessage(String message, String url) => TWString.fromPointer(
        iTWBindings.TWTezosMessageSignerFormatMessage(
          TWString(message).pointer,
          TWString(url).pointer,
        ),
      ).toString();

  /// Implement input to payload as described in: https://tezostaquito.io/docs/signing/
  ///
  /// \param [message] formatted message to be turned into an hex payload
  /// \return the hexpayload of the formated message as a hex string
  String inputToPayload(String message) => TWString.fromPointer(
        iTWBindings.TWTezosMessageSignerInputToPayload(
          TWString(message).pointer,
        ),
      ).toString();

  /// Sign a message as described in https://tezostaquito.io/docs/signing/
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [message] A custom message payload (hex) which is input to the signing.
  /// \returns the signature, Hex-encoded. On invalid input empty string is returned. Returned object needs to be deleted after use.
  String signMessage(TWPrivateKey privateKey, String message) =>
      TWString.fromPointer(
        iTWBindings.TWTezosMessageSignerSignMessage(
          privateKey.pointer,
          TWString(message).pointer,
        ),
      ).toString();

  /// Verify signature for a message as described in https://tezostaquito.io/docs/signing/
  ///
  /// \param [pubKey] pubKey that will verify the message from the signature
  /// \param [message] the message signed as a payload (hex)
  /// \param [signature] in Base58-encoded form.
  /// \returns false on any invalid input (does not throw), true if the message can be verified from the signature
  bool verifyMessage({
    required TWPublicKey pubKey,
    required String message,
    required String signature,
  }) =>
      iTWBindings.TWTezosMessageSignerVerifyMessage(
        pubKey.pointer,
        TWString(message).pointer,
        TWString(signature).pointer,
      );
}
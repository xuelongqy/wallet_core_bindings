part of '../wallet_core_bindings.dart';

/// Bitcoin message signing and verification.
///
/// Bitcoin Core and some other wallets support a message signing & verification format, to create a proof (a signature)
/// that someone has access to the private keys of a specific address.
/// This feature currently works on old legacy addresses only.
class TWBitcoinMessageSigner {
  TWBitcoinMessageSigner._();

  /// Sign a message.
  ///
  /// \param [privateKey] the private key used for signing
  /// \param [address] the address that matches the privateKey, must be a legacy address (P2PKH)
  /// \param [message] A custom message which is input to the signing.
  /// \note Address is derived assuming compressed public key format.
  /// \returns the signature, Base64-encoded.  On invalid input empty string is returned. Returned object needs to be deleteed after use.
  static String signMessage({
    required TWPrivateKey privateKey,
    required String address,
    required String message,
  }) =>
      TWString.fromPointer(_bitcoinMessageSignerImpl.signMessage(
        privateKey.pointer,
        TWString(address).pointer,
        TWString(message).pointer,
      )).value!;

  /// Verify signature for a message.
  ///
  /// \param [address] address to use, only legacy is supported
  /// \param [message] the message signed (without prefix)
  /// \param [signature] in Base64-encoded form.
  /// \returns false on any invalid input (does not throw).
  static bool verifyMessage({
    required String address,
    required String message,
    required String signature,
  }) =>
      _bitcoinMessageSignerImpl.verifyMessage(
        TWString(address).pointer,
        TWString(message).pointer,
        TWString(signature).pointer,
      );
}

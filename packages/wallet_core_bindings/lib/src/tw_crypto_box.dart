part of '../wallet_core_bindings.dart';

/// `crypto_box` encryption algorithms.
class TWCryptoBox {
  TWCryptoBox._();

  /// Encrypts message using `my_secret` and `other_pubkey`.
  /// The output will have a randomly generated nonce prepended to it.
  /// The output will be Overhead + 24 bytes longer than the original.
  ///
  /// \param [mySecret] pointer to my secret key.
  /// \param [otherPubkey] pointer to other's public key.
  /// \param [message] pointer to the message to be encrypted.
  /// \return the encrypted message with randomly generated nonce prepended to it.
  static Uint8List? encryptEasy({
    required TWCryptoBoxSecretKey mySecret,
    required TWCryptoBoxPublicKey otherPubkey,
    required Uint8List message,
  }) {
    return TWData.fromPointer(
      _cryptoBoxImpl.encryptEasy(
        mySecret.pointer,
        otherPubkey.pointer,
        TWData(message).pointer,
      ),
    ).bytes();
  }

  /// Decrypts box produced by `TWCryptoBoxEncryptEasy`.
  /// We assume a 24-byte nonce is prepended to the encrypted text in box.
  ///
  /// \param [mySecret] pointer to my secret key.
  /// \param [otherPubkey] pointer to other's public key.
  /// \param [encrypted] pointer to the encrypted message with nonce prepended to it.
  /// \return the decrypted message.
  static Uint8List? decryptEasy({
    required TWCryptoBoxSecretKey mySecret,
    required TWCryptoBoxPublicKey otherPubkey,
    required Uint8List encrypted,
  }) {
    return TWData.fromPointer(
      _cryptoBoxImpl.decryptEasy(
        mySecret.pointer,
        otherPubkey.pointer,
        TWData(encrypted).pointer,
      ),
    ).bytes();
  }
}

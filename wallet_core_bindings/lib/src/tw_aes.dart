part of '../wallet_core_bindings.dart';

/// AES encryption/decryption methods.
class TWAES {
  TWAES._();

  /// Encrypts a block of Data using AES in Cipher Block Chaining (CBC) mode.
  ///
  /// \param [key] encryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to encrypt.
  /// \param [iv] initialization vector.
  /// \param [mode] padding mode.
  /// \return encrypted Data.
  static Uint8List? encryptCBC({
    required Uint8List key,
    required Uint8List data,
    required Uint8List iv,
    required TWAESPaddingMode mode,
  }) {
    return TWData.fromPointer(_aesImpl.encryptCBC(
      TWData(key).pointer,
      TWData(data).pointer,
      TWData(iv).pointer,
      mode.value,
    )).bytes();
  }

  /// Decrypts a block of data using AES in Cipher Block Chaining (CBC) mode.
  ///
  /// \param [key] decryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to decrypt.
  /// \param [iv] initialization vector Data.
  /// \param [mode] padding mode.
  /// \return decrypted Data.
  static Uint8List? decryptCBC({
    required Uint8List key,
    required Uint8List data,
    required Uint8List iv,
    required TWAESPaddingMode mode,
  }) {
    return TWData.fromPointer(_aesImpl.decryptCBC(
      TWData(key).pointer,
      TWData(data).pointer,
      TWData(iv).pointer,
      mode.value,
    )).bytes();
  }

  /// Encrypts a block of data using AES in Counter (CTR) mode.
  ///
  /// \param [key] encryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to encrypt.
  /// \param [iv] initialization vector Data.
  /// \return encrypted Data.
  static Uint8List? encryptCTR({
    required Uint8List key,
    required Uint8List data,
    required Uint8List iv,
  }) {
    return TWData.fromPointer(_aesImpl.encryptCTR(
      TWData(key).pointer,
      TWData(data).pointer,
      TWData(iv).pointer,
    )).bytes();
  }

  /// Decrypts a block of data using AES in Counter (CTR) mode.
  ///
  /// \param [key] decryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to decrypt.
  /// \param [iv] initialization vector Data.
  /// \return decrypted Data.
  static Uint8List? decryptCTR({
    required Uint8List key,
    required Uint8List data,
    required Uint8List iv,
  }) {
    return TWData.fromPointer(_aesImpl.decryptCTR(
      TWData(key).pointer,
      TWData(data).pointer,
      TWData(iv).pointer,
    )).bytes();
  }
}

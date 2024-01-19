part of '../wallet_core_bindings.dart';

/// AES encryption/decryption methods.
class TWAES {
  /// Encrypts a block of Data using AES in Cipher Block Chaining (CBC) mode.
  ///
  /// \param [key] encryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to encrypt.
  /// \param [iv] initialization vector.
  /// \param [mode] padding mode.
  /// \return encrypted Data.
  static TWData encryptCBC({
    required TWData key,
    required TWData data,
    required TWData iv,
    required int mode,
  }) {
    return TWData.fromPointer(iTWBindings.TWAESEncryptCBC(
        key.pointer, data.pointer, iv.pointer, mode));
  }

  /// Decrypts a block of data using AES in Cipher Block Chaining (CBC) mode.
  ///
  /// \param [key] decryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to decrypt.
  /// \param [iv] initialization vector Data.
  /// \param [mode] padding mode.
  /// \return decrypted Data.
  static TWData decryptCBC({
    required TWData key,
    required TWData data,
    required TWData iv,
    required int mode,
  }) {
    return TWData.fromPointer(iTWBindings.TWAESDecryptCBC(
        key.pointer, data.pointer, iv.pointer, mode));
  }

  /// Encrypts a block of data using AES in Counter (CTR) mode.
  ///
  /// \param [key] encryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to encrypt.
  /// \param [iv] initialization vector Data.
  /// \return encrypted Data.
  static TWData encryptCTR({
    required TWData key,
    required TWData data,
    required TWData iv,
  }) {
    return TWData.fromPointer(
        iTWBindings.TWAESEncryptCTR(key.pointer, data.pointer, iv.pointer));
  }

  /// Decrypts a block of data using AES in Counter (CTR) mode.
  ///
  /// \param [key] decryption key Data, must be 16, 24, or 32 bytes long.
  /// \param [data] Data to decrypt.
  /// \param [iv] initialization vector Data.
  /// \return decrypted Data.
  static TWData decryptCTR({
    required TWData key,
    required TWData data,
    required TWData iv,
  }) {
    return TWData.fromPointer(
        iTWBindings.TWAESDecryptCTR(key.pointer, data.pointer, iv.pointer));
  }
}

part of '../wallet_core_bindings.dart';

/// Password-Based Key Derivation Function 2
class TWPBKDF2 {
  TWPBKDF2._();

  /// Derives a key from a password and a salt using PBKDF2 + Sha256.
  ///
  /// \param [password] is the master password from which a derived key is generated
  /// \param [salt] is a sequence of bits, known as a cryptographic salt
  /// \param [iterations] is the number of iterations desired
  /// \param [dkLen] is the desired bit-length of the derived key
  /// \return the derived key data.
  static Uint8List hmacSha256({
    required Uint8List password,
    required Uint8List salt,
    required int iterations,
    required int dkLen,
  }) =>
      TWData.fromPointer(iTWBindings.TWPBKDF2HmacSha256(
        TWData(password).pointer,
        TWData(salt).pointer,
        iterations,
        dkLen,
      )).bytes()!;

  /// Derives a key from a password and a salt using PBKDF2 + Sha512.
  ///
  /// \param [password] is the master password from which a derived key is generated
  /// \param [salt] is a sequence of bits, known as a cryptographic salt
  /// \param [iterations] is the number of iterations desired
  /// \param [dkLen] is the desired bit-length of the derived key
  /// \return the derived key data.
  static Uint8List hmacSha512({
    required Uint8List password,
    required Uint8List salt,
    required int iterations,
    required int dkLen,
  }) =>
      TWData.fromPointer(iTWBindings.TWPBKDF2HmacSha512(
        TWData(password).pointer,
        TWData(salt).pointer,
        iterations,
        dkLen,
      )).bytes()!;
}

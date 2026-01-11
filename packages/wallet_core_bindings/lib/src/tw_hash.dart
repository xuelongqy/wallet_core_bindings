part of '../wallet_core_bindings.dart';

/// Hasher function type.
typedef TWHasher = Uint8List Function(Uint8List data);

/// Hash functions
class TWHash {
  TWHash._();

  static const int sha1Length = 20;
  static const int sha256Length = 32;
  static const int sha512Length = 64;
  static const int ripemdLength = 20;

  /// Computes the SHA1 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA1 block of data
  static Uint8List sha1(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha1(TWData(data).pointer)).bytes()!;

  /// Computes the SHA256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA256 block of data
  static Uint8List sha256(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha256(TWData(data).pointer)).bytes()!;

  /// Computes the SHA512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA512 block of data
  static Uint8List sha512(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha512(TWData(data).pointer)).bytes()!;

  /// Computes the SHA512_256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA512_256 block of data
  static Uint8List sha512_256(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha512_256(TWData(data).pointer)).bytes()!;

  /// Computes the Keccak256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Keccak256 block of data
  static Uint8List keccak256(Uint8List data) =>
      TWData.fromPointer(_hashImpl.keccak256(TWData(data).pointer)).bytes()!;

  /// Computes the Keccak512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Keccak512 block of data
  static Uint8List keccak512(Uint8List data) =>
      TWData.fromPointer(_hashImpl.keccak512(TWData(data).pointer)).bytes()!;

  /// Computes the SHA3_256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA3_256 block of data
  static Uint8List sha3_256(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha3_256(TWData(data).pointer)).bytes()!;

  /// Computes the SHA3_512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA3_512 block of data
  static Uint8List sha3_512(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha3_512(TWData(data).pointer)).bytes()!;

  /// Computes the RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed RIPEMD block of data
  static Uint8List ripemd(Uint8List data) =>
      TWData.fromPointer(_hashImpl.ripemd(TWData(data).pointer)).bytes()!;

  /// Computes the Blake256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256 block of data
  static Uint8List blake256(Uint8List data) =>
      TWData.fromPointer(_hashImpl.blake256(TWData(data).pointer)).bytes()!;

  /// Computes the Blake256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256 block of data
  static Uint8List blake2b(Uint8List data, int size) =>
      TWData.fromPointer(_hashImpl.blake2b(TWData(data).pointer, size))
          .bytes()!;

  static Uint8List blake2bPersonal(
          Uint8List data, Uint8List personal, int outlen) =>
      TWData.fromPointer(_hashImpl.blake2bPersonal(
        TWData(data).pointer,
        TWData(personal).pointer,
        outlen,
      )).bytes()!;

  /// Computes the Groestl512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Groestl512 block of data
  static Uint8List groestl512(Uint8List data) =>
      TWData.fromPointer(_hashImpl.groestl512(TWData(data).pointer)).bytes()!;

  /// Computes the SHA256D of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA256D block of data
  static Uint8List sha256SHA256(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha256SHA256(TWData(data).pointer)).bytes()!;

  /// Computes the SHA256RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA256RIPEMD block of data
  static Uint8List sha256RIPEMD(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha256RIPEMD(TWData(data).pointer)).bytes()!;

  /// Computes the SHA3_256RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA3_256RIPEMD block of data
  static Uint8List sha3_256RIPEMD(Uint8List data) =>
      TWData.fromPointer(_hashImpl.sha3_256RIPEMD(TWData(data).pointer))
          .bytes()!;

  /// Computes the Blake256D of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256D block of data
  static Uint8List blake256Blake256(Uint8List data) =>
      TWData.fromPointer(_hashImpl.blake256Blake256(TWData(data).pointer))
          .bytes()!;

  /// Computes the Blake256RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256RIPEMD block of data
  static Uint8List blake256RIPEMD(Uint8List data) =>
      TWData.fromPointer(_hashImpl.blake256RIPEMD(TWData(data).pointer))
          .bytes()!;

  /// Computes the Groestl512D of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Groestl512D block of data
  static Uint8List groestl512Groestl512(Uint8List data) =>
      TWData.fromPointer(_hashImpl.groestl512Groestl512(TWData(data).pointer))
          .bytes()!;
}

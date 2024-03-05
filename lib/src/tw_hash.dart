part of '../wallet_core_bindings.dart';

/// Hasher function type.
typedef Uint8List TWHasher(Uint8List data);

/// Hash functions
class TWHash {
  static const int sha1Length = 20;
  static const int sha256Length = 32;
  static const int sha512Length = 64;
  static const int ripemdLength = 20;

  /// Computes the SHA1 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA1 block of data
  static Uint8List sha1(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA1(TWData(data).pointer)).bytes()!;

  /// Computes the SHA256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA256 block of data
  static Uint8List sha256(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA256(TWData(data).pointer))
          .bytes()!;

  /// Computes the SHA512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA512 block of data
  static Uint8List sha512(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA512(TWData(data).pointer))
          .bytes()!;

  /// Computes the SHA512_256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA512_256 block of data
  static Uint8List sha512_256(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA512_256(TWData(data).pointer))
          .bytes()!;

  /// Computes the Keccak256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Keccak256 block of data
  static Uint8List keccak256(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashKeccak256(TWData(data).pointer))
          .bytes()!;

  /// Computes the Keccak512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Keccak512 block of data
  static Uint8List keccak512(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashKeccak512(TWData(data).pointer))
          .bytes()!;

  /// Computes the SHA3_256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA3_256 block of data
  static Uint8List sha3_256(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA3_256(TWData(data).pointer))
          .bytes()!;

  /// Computes the SHA3_512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA3_512 block of data
  static Uint8List sha3_512(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA3_512(TWData(data).pointer))
          .bytes()!;

  /// Computes the RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed RIPEMD block of data
  static Uint8List ripemd(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashRIPEMD(TWData(data).pointer))
          .bytes()!;

  /// Computes the Blake256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256 block of data
  static Uint8List blake256(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashBlake256(TWData(data).pointer))
          .bytes()!;

  /// Computes the Blake256 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256 block of data
  static Uint8List blake2b(Uint8List data, int size) =>
      TWData.fromPointer(iTWBindings.TWHashBlake2b(TWData(data).pointer, size))
          .bytes()!;

  static Uint8List blake2bPersonal(
          Uint8List data, Uint8List personal, int outlen) =>
      TWData.fromPointer(iTWBindings.TWHashBlake2bPersonal(
        TWData(data).pointer,
        TWData(personal).pointer,
        outlen,
      )).bytes()!;

  /// Computes the Groestl512 of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Groestl512 block of data
  static Uint8List groestl512(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashGroestl512(TWData(data).pointer))
          .bytes()!;

  /// Computes the SHA256D of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA256D block of data
  static Uint8List sha256SHA256(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA256SHA256(TWData(data).pointer))
          .bytes()!;

  /// Computes the SHA256RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA256RIPEMD block of data
  static Uint8List sha256RIPEMD(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA256RIPEMD(TWData(data).pointer))
          .bytes()!;

  /// Computes the SHA3_256RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed SHA3_256RIPEMD block of data
  static Uint8List sha3_256RIPEMD(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashSHA3_256RIPEMD(TWData(data).pointer))
          .bytes()!;

  /// Computes the Blake256D of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256D block of data
  static Uint8List blake256Blake256(Uint8List data) => TWData.fromPointer(
          iTWBindings.TWHashBlake256Blake256(TWData(data).pointer))
      .bytes()!;

  /// Computes the Blake256RIPEMD of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Blake256RIPEMD block of data
  static Uint8List blake256RIPEMD(Uint8List data) =>
      TWData.fromPointer(iTWBindings.TWHashBlake256RIPEMD(TWData(data).pointer))
          .bytes()!;

  /// Computes the Groestl512D of a block of data.
  ///
  /// \param [data] Non-null block of data
  /// \return Non-null computed Groestl512D block of data
  static Uint8List groestl512Groestl512(Uint8List data) => TWData.fromPointer(
          iTWBindings.TWHashGroestl512Groestl512(TWData(data).pointer))
      .bytes()!;
}

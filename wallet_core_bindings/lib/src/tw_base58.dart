part of '../wallet_core_bindings.dart';

class TWBase58 {
  TWBase58._();

  /// Encodes data as a Base58 string, including the checksum.
  ///
  /// \param [data] The data to encode.
  /// \return the encoded Base58 string with checksum.
  static String encode(Uint8List data) =>
      TWString.fromPointer(_base58Impl.encode(TWData(data).pointer)).value!;

  /// Encodes data as a Base58 string, not including the checksum.
  ///
  /// \param [data] The data to encode.
  /// \return then encoded Base58 string without checksum.
  static String encodeNoCheck(Uint8List data) =>
      TWString.fromPointer(_base58Impl.encodeNoCheck(TWData(data).pointer))
          .value!;

  /// Decodes a Base58 string, checking the checksum. Returns null if the string is not a valid Base58 string.
  ///
  /// \param [string] The Base58 string to decode.
  /// \return the decoded data, empty if the string is not a valid Base58 string with checksum.
  static Uint8List? decode(String string) =>
      TWData.fromPointer(_base58Impl.decode(TWString(string).pointer)).bytes();

  /// Decodes a Base58 string, w/o checking the checksum. Returns null if the string is not a valid Base58 string.
  ///
  /// \param [string] The Base58 string to decode.
  /// \return the decoded data, empty if the string is not a valid Base58 string without checksum.
  static Uint8List? decodeNoCheck(String string) =>
      TWData.fromPointer(_base58Impl.decodeNoCheck(TWString(string).pointer))
          .bytes();
}

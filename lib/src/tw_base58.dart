part of '../wallet_core_bindings.dart';

class TWBase58 {
  /// Encodes data as a Base58 string, including the checksum.
  ///
  /// \param [data] The data to encode.
  /// \return the encoded Base58 string with checksum.
  static String encode(Uint8List data) =>
      TWString.fromPointer(iTWBindings.TWBase58Encode(TWData(data).pointer))
          .value!;

  /// Encodes data as a Base58 string, not including the checksum.
  ///
  /// \param [data] The data to encode.
  /// \return then encoded Base58 string without checksum.
  static String encodeNoCheck(Uint8List data) => TWString.fromPointer(
          iTWBindings.TWBase58EncodeNoCheck(TWData(data).pointer))
      .value!;

  /// Decodes a Base58 string, checking the checksum. Returns null if the string is not a valid Base58 string.
  ///
  /// \param [string] The Base58 string to decode.
  /// \return the decoded data, empty if the string is not a valid Base58 string with checksum.
  static Uint8List? decode(String string) =>
      TWData.fromPointer(iTWBindings.TWBase58Decode(TWString(string).pointer))
          .bytes();

  /// Decodes a Base58 string, w/o checking the checksum. Returns null if the string is not a valid Base58 string.
  ///
  /// \param [string] The Base58 string to decode.
  /// \return the decoded data, empty if the string is not a valid Base58 string without checksum.
  static Uint8List? decodeNoCheck(String string) => TWData.fromPointer(
          iTWBindings.TWBase58DecodeNoCheck(TWString(string).pointer))
      .bytes();
}

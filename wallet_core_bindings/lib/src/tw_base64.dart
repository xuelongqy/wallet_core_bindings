part of '../wallet_core_bindings.dart';

class TWBase64 {
  TWBase64._();

  /// Encode an input to Base64 with the default alphabet (RFC4648 with '+', '/')
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \return The encoded data
  static String encode(Uint8List data) =>
      TWString.fromPointer(_base64Impl.encode(TWData(data).pointer)).value!;

  /// Encode an input to Base64 with the alphabet safe for URL-s and filenames (RFC4648 with '-', '_')
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \return The encoded data
  static String encodeUrl(Uint8List data) =>
      TWString.fromPointer(_base64Impl.encodeUrl(TWData(data).pointer)).value!;

  /// Decode a Base64 input with the default alphabet (RFC4648 with '+', '/')
  ///
  /// \param [string] Encoded input to be decoded
  /// \return The decoded data, empty if decoding failed.
  static Uint8List? decode(String string) =>
      TWData.fromPointer(_base64Impl.decode(TWString(string).pointer)).bytes();

  /// Decode a Base64 input with the alphabet safe for URL-s and filenames (RFC4648 with '-', '_')
  ///
  /// \param [string] Encoded base64 input to be decoded
  /// \return The decoded data, empty if decoding failed.
  static Uint8List? decodeUrl(String string) =>
      TWData.fromPointer(_base64Impl.decodeUrl(TWString(string).pointer))
          .bytes();
}

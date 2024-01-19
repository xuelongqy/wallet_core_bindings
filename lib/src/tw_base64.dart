part of '../wallet_core_bindings.dart';

class TWBase64 {
  /// Encode an input to Base64 with the default alphabet (RFC4648 with '+', '/')
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \return The encoded data
  static String encode(Uint8List data) {
    TWData twData = TWData(data);
    TWString twRes =
        TWString.fromPointer(iTWBindings.TWBase64Encode(twData.pointer));
    String res = twRes.toString();
    twData.delete();
    twRes.delete();
    return res;
  }

  /// Encode an input to Base64 with the alphabet safe for URL-s and filenames (RFC4648 with '-', '_')
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \return The encoded data
  static String encodeUrl(Uint8List data) {
    TWData twData = TWData(data);
    TWString twRes =
        TWString.fromPointer(iTWBindings.TWBase64EncodeUrl(twData.pointer));
    String res = twRes.toString();
    twData.delete();
    twRes.delete();
    return res;
  }

  /// Decode a Base64 input with the default alphabet (RFC4648 with '+', '/')
  ///
  /// \param [string] Encoded input to be decoded
  /// \return The decoded data, empty if decoding failed.
  static Uint8List decode(String string) {
    TWString twString = TWString(string);
    TWData twRes =
        TWData.fromPointer(iTWBindings.TWBase64Decode(twString.pointer));
    Uint8List res = twRes.bytes();
    twString.delete();
    twRes.delete();
    return res;
  }

  /// Decode a Base64 input with the alphabet safe for URL-s and filenames (RFC4648 with '-', '_')
  ///
  /// \param [string] Encoded base64 input to be decoded
  /// \return The decoded data, empty if decoding failed.
  static Uint8List decodeUrl(String string) {
    TWString twString = TWString(string);
    TWData twRes =
        TWData.fromPointer(iTWBindings.TWBase64DecodeUrl(twString.pointer));
    Uint8List res = twRes.bytes();
    twString.delete();
    twRes.delete();
    return res;
  }
}

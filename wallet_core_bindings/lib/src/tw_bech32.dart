part of '../wallet_core_bindings.dart';

/// Bech32 encode / decode functions
class TWBech32 {
  TWBech32._();

  /// Encodes data as a Bech32 string.
  ///
  /// \param [hrp] The human-readable part.
  /// \param [data] The data part.
  /// \return the encoded Bech32 string.
  static String encode(String hrp, Uint8List data) => TWString.fromPointer(
          _bech32Impl.encode(TWString(hrp).pointer, TWData(data).pointer))
      .value!;

  /// Decodes a Bech32 string. Returns null if the string is not a valid Bech32 string.
  ///
  /// \param [string] The Bech32 string to decode.
  /// \return the decoded data, null if the string is not a valid Bech32 string. Note that the human-readable part is not returned.
  static Uint8List? decode(String string) =>
      TWData.fromPointer(_bech32Impl.decode(TWString(string).pointer)).bytes();

  /// Encodes data as a Bech32m string.
  ///
  /// \param hrp The human-readable part.
  /// \param data The data part.
  /// \return the encoded Bech32m string.
  static String encodeM(String hrp, Uint8List data) => TWString.fromPointer(
          _bech32Impl.encodeM(TWString(hrp).pointer, TWData(data).pointer))
      .value!;

  /// Decodes a Bech32m string. Returns null if the string is not a valid Bech32m string.
  ///
  /// \param string The Bech32m string to decode.
  /// \return the decoded data, null if the string is not a valid Bech32m string. Note that the human-readable part is not returned.
  static Uint8List? decodeM(String string) =>
      TWData.fromPointer(_bech32Impl.decodeM(TWString(string).pointer)).bytes();
}

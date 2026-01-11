part of '../wallet_core_bindings.dart';

/// Base32 encode / decode functions
class TWBase32 {
  TWBase32._();

  /// Decode a Base32 input with the given alphabet
  ///
  /// \param [string] Encoded base32 input to be decoded
  /// \param [alphabet] Decode with the given alphabet, if nullptr ALPHABET_RFC4648 is used by default
  /// \return The decoded data, can be null.
  /// \note ALPHABET_RFC4648 doesn't support padding in the default alphabet
  static Uint8List? decodeWithAlphabet({
    required String string,
    required String alphabet,
  }) =>
      TWData.fromPointer(_base32Impl.decodeWithAlphabet(
              TWString(string).pointer, TWString(alphabet).pointer))
          .bytes();

  /// Decode a Base32 input with the default alphabet (ALPHABET_RFC4648)
  ///
  /// \param [string] Encoded input to be decoded
  /// \return The decoded data
  /// \note Call TWBase32DecodeWithAlphabet with nullptr.
  static Uint8List? decode(String string) =>
      TWData.fromPointer(_base32Impl.decode(TWString(string).pointer)).bytes();

  /// Encode an input to Base32 with the given alphabet
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \param [alphabet] Encode with the given alphabet, if nullptr ALPHABET_RFC4648 is used by default
  /// \return The encoded data
  /// \note ALPHABET_RFC4648 doesn't support padding in the default alphabet
  static String encodeWithAlphabet({
    required Uint8List data,
    required String alphabet,
  }) =>
      TWString.fromPointer(_base32Impl.encodeWithAlphabet(
              TWData(data).pointer, TWString(alphabet).pointer))
          .value!;

  /// Encode an input to Base32 with the default alphabet (ALPHABET_RFC4648)
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \return The encoded data
  /// \note Call TWBase32EncodeWithAlphabet with nullptr.
  static String encode(Uint8List data) =>
      TWString.fromPointer(_base32Impl.encode(TWData(data).pointer)).value!;
}

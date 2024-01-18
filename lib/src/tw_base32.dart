part of '../wallet_core_bindings.dart';

/// Base32 encode / decode functions
class TWBase32 {
  final Pointer<bindings.TWBase32> _pointer;

  Pointer<bindings.TWBase32> get pointer => _pointer;

  const TWBase32.fromPointer(this._pointer);

  /// Decode a Base32 input with the given alphabet
  ///
  /// \param [string] Encoded base32 input to be decoded
  /// \param [alphabet] Decode with the given alphabet, if nullptr ALPHABET_RFC4648 is used by default
  /// \return The decoded data, can be null.
  /// \note ALPHABET_RFC4648 doesn't support padding in the default alphabet
  static TWData decodeWithAlphabet({
    required String string,
    required String alphabet,
  }) {
    TWString twString = TWString(string);
    TWString twAlphabet = TWString(alphabet);
    TWData res = TWData.fromPointer(iTWBindings.TWBase32DecodeWithAlphabet(
        twString.pointer, twAlphabet.pointer));
    twString.delete();
    twAlphabet.delete();
    return res;
  }

  /// Decode a Base32 input with the default alphabet (ALPHABET_RFC4648)
  ///
  /// \param [string] Encoded input to be decoded
  /// \return The decoded data
  /// \note Call TWBase32DecodeWithAlphabet with nullptr.
  static TWData decode(String string) {
    TWString twString = TWString(string);
    TWData res =
        TWData.fromPointer(iTWBindings.TWBase32Decode(twString.pointer));
    twString.delete();
    return res;
  }

  /// Encode an input to Base32 with the given alphabet
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \param [alphabet] Encode with the given alphabet, if nullptr ALPHABET_RFC4648 is used by default
  /// \return The encoded data
  /// \note ALPHABET_RFC4648 doesn't support padding in the default alphabet
  static String encodeWithAlphabet({
    required TWData twData,
    required String alphabet,
  }) {
    TWString twAlphabet = TWString(alphabet);
    TWString twRes = TWString.fromPointer(
        iTWBindings.TWBase32EncodeWithAlphabet(
            twData.pointer, twAlphabet.pointer));
    String res = twRes.toString();
    twAlphabet.delete();
    twRes.delete();
    return res;
  }

  /// Encode an input to Base32 with the default alphabet (ALPHABET_RFC4648)
  ///
  /// \param [data] Data to be encoded (raw bytes)
  /// \return The encoded data
  /// \note Call TWBase32EncodeWithAlphabet with nullptr.
  static String encode(TWData data) {
    TWString twRes =
        TWString.fromPointer(iTWBindings.TWBase32Encode(data.pointer));
    String res = twRes.toString();
    twRes.delete();
    return res;
  }
}

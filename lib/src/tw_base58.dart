part of '../wallet_core_bindings.dart';

class TWBase58 {
  final Pointer<bindings.TWBase58> _pointer;

  Pointer<bindings.TWBase58> get pointer => _pointer;

  const TWBase58.fromPointer(this._pointer);

  /// Encodes data as a Base58 string, including the checksum.
  ///
  /// \param [data] The data to encode.
  /// \return the encoded Base58 string with checksum.
  static String encode(Uint8List data) {
    TWData twData = TWData(data);
    TWString twRes =
        TWString.fromPointer(iTWBindings.TWBase58Encode(twData.pointer));
    String res = twRes.toString();
    twData.delete();
    twRes.delete();
    return res;
  }

  /// Encodes data as a Base58 string, not including the checksum.
  ///
  /// \param [data] The data to encode.
  /// \return then encoded Base58 string without checksum.
  static String encodeNoCheck(Uint8List data) {
    TWData twData = TWData(data);
    TWString twRes =
        TWString.fromPointer(iTWBindings.TWBase58EncodeNoCheck(twData.pointer));
    String res = twRes.toString();
    twData.delete();
    twRes.delete();
    return res;
  }

  /// Decodes a Base58 string, checking the checksum. Returns null if the string is not a valid Base58 string.
  ///
  /// \param [string] The Base58 string to decode.
  /// \return the decoded data, empty if the string is not a valid Base58 string with checksum.
  static Uint8List decode(String string) {
    TWString twString = TWString(string);
    TWData twRes =
        TWData.fromPointer(iTWBindings.TWBase58Decode(twString.pointer));
    Uint8List res = twRes.bytes();
    twString.delete();
    twRes.delete();
    return res;
  }

  /// Decodes a Base58 string, w/o checking the checksum. Returns null if the string is not a valid Base58 string.
  ///
  /// \param [string] The Base58 string to decode.
  /// \return the decoded data, empty if the string is not a valid Base58 string without checksum.
  static Uint8List decodeNoCheck(String string) {
    TWString twString = TWString(string);
    TWData twRes =
        TWData.fromPointer(iTWBindings.TWBase58DecodeNoCheck(twString.pointer));
    Uint8List res = twRes.bytes();
    twString.delete();
    twRes.delete();
    return res;
  }
}

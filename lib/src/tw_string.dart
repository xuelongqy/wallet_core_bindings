part of '../wallet_core_bindings.dart';

/// Defines a resizable string.
///
/// The implementantion of these methods should be language-specific to minimize translation
/// overhead. For instance it should be a `jstring` for Java and an `NSString` for Swift. Create
/// allocates memory, the delete call should be called at the end to release memory.
class TWString {
  final Pointer<Void> _pointer;

  Pointer<Void> get pointer => _pointer;

  const TWString.fromPointer(this._pointer);

  TWString(String value)
      : _pointer = iTWBindings.TWStringCreateWithUTF8Bytes(
            value.toNativeUtf8().cast());

  /// Creates a TWString from a null-terminated UTF8 byte array. It must be deleted at the end.
  ///
  /// \param [bytes] a null-terminated UTF8 byte array.
  TWString.createWithUTF8Bytes(Pointer<Char> bytes)
      : _pointer = iTWBindings.TWStringCreateWithUTF8Bytes(bytes);

  /// Creates a string from a raw byte array and size. It must be deleted at the end.
  ///
  /// \param [bytes] a raw byte array.
  /// \param [size] the size of the byte array.
  TWString.createWithRawBytes(Pointer<Uint8> bytes, int size)
      : _pointer = iTWBindings.TWStringCreateWithRawBytes(bytes, size);

  /// Creates a hexadecimal string from a block of data. It must be deleted at the end.
  ///
  /// \param [data] a block of data.
  TWString.createWithHexData(TWData data)
      : _pointer = iTWBindings.TWStringCreateWithHexData(data.pointer);

  /// Returns the string size in bytes.
  int size() => iTWBindings.TWStringSize(_pointer);

  /// Returns the byte at the provided index.
  ///
  /// \param [index] the index of the byte.
  String get(int index) => String.fromCharCode(iTWBindings.TWStringGet(_pointer, index));

  /// Returns the raw pointer to the string's UTF8 bytes (null-terminated).
  Pointer<Char> utf8Bytes() => iTWBindings.TWStringUTF8Bytes(_pointer);

  @override
  String toString() => utf8Bytes().cast<Utf8>().toDartString();

  /// Deletes a string created with a `TWStringCreate*` method and frees the memory.
  void delete() => iTWBindings.TWStringDelete(_pointer);

  /// Determines whether two string blocks are equal.
  ///
  /// \param [another] Another TWString pointer.
  bool equal(TWString another) => iTWBindings.TWStringEqual(_pointer, another.pointer);
}

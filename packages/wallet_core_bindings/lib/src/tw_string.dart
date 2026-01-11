part of '../wallet_core_bindings.dart';

/// TWString finalizer.
final _twStringFinalizer = Finalizer<int>((int token) {
  _stringImpl.delete(token);
});

/// Defines a resizable string.
///
/// The _stringImplementantion of these methods should be language-specific to minimize translation
/// overhead. For instance it should be a `jstring` for Java and an `NSString` for Swift. Create
/// allocates memory, the delete call should be called at the end to release memory.
class TWString extends TWObjectFinalizable {
  TWString.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twStringFinalizer);

  TWString(
    String value, {
    bool attach = true,
  }) : super(_stringImpl.create(value),
            attach: attach, finalizer: _twStringFinalizer);

  /// Creates a string from a raw byte array and size. It must be deleted at the end.
  ///
  /// \param [bytes] a raw byte array.
  TWString.createWithRawBytes(
    Uint8List bytes, {
    bool attach = true,
  }) : super(
          _stringImpl.createWithRawBytes(bytes),
          attach: attach,
          finalizer: _twStringFinalizer,
        );

  /// Creates a hexadecimal string from a block of data. It must be deleted at the end.
  ///
  /// \param [bytes] a block of data.
  TWString.createWithHexBytes(
    Uint8List bytes, {
    bool attach = true,
  }) : super(_stringImpl.createWithHexData(TWData(bytes).pointer),
            attach: attach, finalizer: _twStringFinalizer);

  /// Creates a hexadecimal string from a block of data. It must be deleted at the end.
  ///
  /// \param [data] a block of data.
  TWString.createWithHexData(
    TWData data, {
    bool attach = true,
  }) : super(_stringImpl.createWithHexData(data.pointer),
            attach: attach, finalizer: _twStringFinalizer);

  /// Returns the string size in bytes.
  int get size => _stringImpl.size(_pointer);

  /// Returns the byte at the provided index.
  ///
  /// \param [index] the index of the byte.
  String get(int index) =>
      String.fromCharCode(_stringImpl.get(_pointer, index));

  /// Overloaded operator ==, equivalent to [TWString.get].
  String operator [](int index) => get(index);

  /// Returns the raw pointer to the string's UTF8 bytes (null-terminated).
  int utf8Bytes() => _stringImpl.utf8Bytes(_pointer);

  /// Returns raw data.
  Uint8List bytes() => _stringImpl.bytes(_pointer);

  /// Returns the string value.
  String? get value {
    if (_pointer == 0) {
      return null;
    }
    return String.fromCharCodes(bytes());
  }

  /// Deletes a string created with a `TWStringCreate*` method and frees the memory.
  @override
  void delete() {
    super.delete();
    _stringImpl.delete(_pointer);
  }

  /// Determines whether two string blocks are equal.
  ///
  /// \param [another] Another TWString pointer.
  bool equal(TWString another) => _stringImpl.equal(_pointer, another.pointer);

  /// Overloaded operator ==, equivalent to [TWString.equal].
  @override
  bool operator ==(Object other) => other is TWString && equal(other);

  @override
  int get hashCode => pointer.hashCode;
}

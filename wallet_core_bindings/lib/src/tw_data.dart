part of '../wallet_core_bindings.dart';

/// TWData finalizer.
final _twDataFinalizer = Finalizer<int>((int token) {
  _dataImpl.delete(token);
});

/// Defines a resizable block of data.
///
/// The implementantion of these methods should be language-specific to minimize translation overhead. For instance it
/// should be a `jbyteArray` for Java and an `NSData` for Swift.
class TWData extends TWObjectFinalizable {
  TWData.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twDataFinalizer);

  /// Creates a block of data from a byte array.
  ///
  /// \param [bytes] Non-null raw bytes buffer
  TWData(
    Uint8List bytes, {
    bool attach = true,
  }) : super(
          _dataImpl.createWithBytes(bytes),
          attach: attach,
          finalizer: _twDataFinalizer,
        );

  /// Creates an uninitialized block of data with the provided size.
  ///
  /// \param [size] size for the block of data
  TWData.createWithSize(
    int size, {
    bool attach = true,
  }) : super(
          _dataImpl.createWithSize(size),
          attach: attach,
          finalizer: _twDataFinalizer,
        );

  /// Creates a block of data by copying another block of data.
  ///
  /// \param [data] buffer that need to be copied
  TWData.createWithData(
    TWData data, {
    bool attach = true,
  }) : super(
          _dataImpl.createWithData(data.pointer),
          attach: attach,
          finalizer: _twDataFinalizer,
        );

  /// Creates a block of data from a hexadecimal string.  Odd length is invalid (intended grouping to bytes is not obvious).
  ///
  /// \param [hex] input hex string
  TWData.createWithHexString(
    String hex, {
    bool attach = true,
  }) : super(
          _dataImpl.createWithHexString(hex),
          attach: attach,
          finalizer: _twDataFinalizer,
        );

  /// Creates a block of data from a string.
  ///
  /// \param [string] input string
  TWData.createWithString(
    String string, {
    bool attach = true,
  }) : super(
          _dataImpl.createWithBytes(Uint8List.fromList(string.codeUnits)),
          attach: attach,
          finalizer: _twDataFinalizer,
        );

  /// Returns the size in bytes.
  ///
  /// \return the size of the given block of data
  int get size => _dataImpl.size(_pointer);

  /// Returns the raw pointer to the contents of data.
  Uint8List? bytes() =>
      _pointer == nullptr.address ? null : _dataImpl.bytes(_pointer);

  /// Returns the hex string of data.
  String? hexString() => _pointer == nullptr.address
      ? null
      : TWString.createWithHexBytes(bytes()!).value;

  /// Returns the byte at the provided index.
  ///
  /// \param [index] index of the byte that we want to fetch - index need to be < TWDataSize(data)
  /// \return the byte at the provided index
  int get(int index) => _dataImpl.get(_pointer, index);

  /// Overloaded operator [], equivalent to [TWData.get].
  int operator [](int index) => get(index);

  /// Sets the byte at the provided index.
  ///
  /// \param [index] index of the byte that we want to set - index need to be < TWDataSize(data)
  /// \param [byte] Given byte to be written in data
  void set(int index, int byte) => _dataImpl.set(_pointer, index, byte);

  /// Overloaded operator []=, equivalent to [TWData.set].
  void operator []=(int index, int byte) => set(index, byte);

  /// Copies a range of bytes into the provided buffer.
  ///
  /// \param [start] starting index of the range - index need to be < TWDataSize(data)
  /// \param [size] size of the range we want to copy - size need to be < TWDataSize(data) - start
  /// \return The output buffer where we want to copy the data.
  Uint8List copyBytes(int start, int size) =>
      _dataImpl.copyBytes(_pointer, start, size);

  /// Replaces a range of bytes with the contents of the provided buffer.
  ///
  /// \param [start] starting index of the range - index need to be < TWDataSize(data)
  /// \param [size] size of the range we want to replace - size need to be < TWDataSize(data) - start
  /// \param [bytes] The buffer that will replace the range of data
  void replaceBytes(int start, int size, Uint8List bytes) =>
      _dataImpl.replaceBytes(_pointer, start, size, bytes);

  /// Appends data from a byte array.
  ///
  /// \param [bytes] Non-null byte array
  /// \param [size] The size of the byte array
  void appendBytes(Uint8List bytes) => _dataImpl.appendBytes(_pointer, bytes);

  /// Appends a single byte.
  ///
  /// \param [byte] A single byte
  void appendByte(int byte) => _dataImpl.appendByte(_pointer, byte);

  /// Appends a block of data.
  ///
  /// \param [append] A non-null valid block of data
  void appendData(TWData append) =>
      _dataImpl.appendData(_pointer, append.pointer);

  /// Reverse the bytes.
  void reverse() => _dataImpl.reverse(_pointer);

  /// Sets all bytes to the given value.
  void reset() => _dataImpl.reset(_pointer);

  /// Deletes a block of data created with a `TWDataCreate*` method.
  @override
  void delete() {
    super.delete();
    _dataImpl.delete(_pointer);
  }

  /// Determines whether two data blocks are equal.
  ///
  /// \param [another] right non null block of data to be compared
  /// \return true if both block of data are equal, false otherwise
  bool equal(TWData another) => _dataImpl.equal(_pointer, another.pointer);

  /// Overloaded operator ==, equivalent to [TWData.equal].
  @override
  bool operator ==(Object other) => other is TWData && equal(other);

  @override
  int get hashCode => _pointer.hashCode;
}

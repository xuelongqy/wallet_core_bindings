part of '../wallet_core_bindings.dart';

/// Defines a resizable block of data.
///
/// The implementantion of these methods should be language-specific to minimize translation overhead. For instance it
/// should be a `jbyteArray` for Java and an `NSData` for Swift.
class TWData {
  final Pointer<Void> _pointer;

  Pointer<Void> get pointer => _pointer;

  const TWData.fromPointer(this._pointer);

  /// Creates a block of data from a hexadecimal string.  Odd length is invalid (intended grouping to bytes is not obvious).
  ///
  /// [hex] input hex string
  TWData(
    String hex,
  ) : _pointer = iTWBindings.TWDataCreateWithHexString(TWString(hex).pointer);

  /// Creates a block of data from a byte array.
  ///
  /// \param [bytes] Non-null raw bytes buffer
  /// \param [size] size of the buffer
  TWData.createWithBytes(
    Pointer<Uint8> bytes,
    int size,
  ) : _pointer = iTWBindings.TWDataCreateWithBytes(bytes, size);

  /// Creates an uninitialized block of data with the provided size.
  ///
  /// \param [size] size for the block of data
  TWData.createWithSize(
    int size,
  ) : _pointer = iTWBindings.TWDataCreateWithSize(size);

  /// Creates a block of data by copying another block of data.
  ///
  /// \param [data] buffer that need to be copied
  TWData.createWithData(
    TWData data,
  ) : _pointer = iTWBindings.TWDataCreateWithData(data.pointer);

  /// Creates a block of data from a hexadecimal string.  Odd length is invalid (intended grouping to bytes is not obvious).
  ///
  /// \param [hex] input hex string
  TWData.createWithHexString(
    TWString hex,
  ) : _pointer = iTWBindings.TWDataCreateWithHexString(hex.pointer);

  /// Returns the size in bytes.
  ///
  /// \return the size of the given block of data
  int size() => iTWBindings.TWDataSize(_pointer);

  /// Returns the raw pointer to the contents of data.
  ///
  /// \return the raw pointer to the contents of data
  Pointer<Uint8> bytes() => iTWBindings.TWDataBytes(_pointer);

  /// Returns the byte at the provided index.
  ///
  /// \param [index] index of the byte that we want to fetch - index need to be < TWDataSize(data)
  /// \return the byte at the provided index
  int get(int index) => iTWBindings.TWDataGet(_pointer, index);

  /// Sets the byte at the provided index.
  ///
  /// \param [index] index of the byte that we want to set - index need to be < TWDataSize(data)
  /// \param [byte] Given byte to be written in data
  void set(int index, int byte) => iTWBindings.TWDataSet(_pointer, index, byte);

  /// Copies a range of bytes into the provided buffer.
  ///
  /// \param [start] starting index of the range - index need to be < TWDataSize(data)
  /// \param [size] size of the range we want to copy - size need to be < TWDataSize(data) - start
  /// \param [output] The output buffer where we want to copy the data.
  void copyBytes(int start, int size, Pointer<Uint8> output) =>
      iTWBindings.TWDataCopyBytes(_pointer, start, size, output);

  /// Replaces a range of bytes with the contents of the provided buffer.
  ///
  /// \param [start] starting index of the range - index need to be < TWDataSize(data)
  /// \param [size] size of the range we want to replace - size need to be < TWDataSize(data) - start
  /// \param [bytes] The buffer that will replace the range of data
  void replaceBytes(int start, int size, Pointer<Uint8> bytes) =>
      iTWBindings.TWDataReplaceBytes(_pointer, start, size, bytes);

  /// Appends data from a byte array.
  ///
  /// \param [bytes] Non-null byte array
  /// \param [size] The size of the byte array
  void appendBytes(Pointer<Uint8> bytes, int size) =>
      iTWBindings.TWDataAppendBytes(_pointer, bytes, size);

  /// Appends a single byte.
  ///
  /// \param [byte] A single byte
  void appendByte(int byte) =>
      iTWBindings.TWDataAppendByte(_pointer, byte);

  /// Appends a block of data.
  ///
  /// \param [append] A non-null valid block of data
  void appendData(TWData append) =>
      iTWBindings.TWDataAppendData(_pointer, append.pointer);

  /// Reverse the bytes.
  void reverse() => iTWBindings.TWDataReverse(_pointer);

  /// Deletes a block of data created with a `TWDataCreate*` method.
  void delete() => iTWBindings.TWDataDelete(_pointer);

  /// Determines whether two data blocks are equal.
  ///
  /// \param [another] right non null block of data to be compared
  /// \return true if both block of data are equal, false otherwise
  bool equal(TWData another) => iTWBindings.TWDataEqual(_pointer, another.pointer);
}

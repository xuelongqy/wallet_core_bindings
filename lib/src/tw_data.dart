part of '../wallet_core_bindings.dart';

/// TWData finalizer.
final _twDataFinalizer = Finalizer<Pointer<Void>>((Pointer<Void> token) {
  iTWBindings.TWDataDelete(token);
});

/// Defines a resizable block of data.
///
/// The implementantion of these methods should be language-specific to minimize translation overhead. For instance it
/// should be a `jbyteArray` for Java and an `NSData` for Swift.
class TWData extends TWObjectFinalizable<Void> {
  TWData.fromPointer(
    Pointer<Void> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twDataFinalizer);

  /// Creates a block of data from a byte array.
  ///
  /// \param [bytes] Non-null raw bytes buffer
  TWData(
    Uint8List bytes, {
    bool attach = true,
  }) : super(
          iTWBindings.TWDataCreateWithBytes(
              bytes.toNativeUint8(), bytes.length),
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
          iTWBindings.TWDataCreateWithSize(size),
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
          iTWBindings.TWDataCreateWithData(data.pointer),
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
          iTWBindings.TWDataCreateWithHexString(TWString(hex).pointer),
          attach: attach,
          finalizer: _twDataFinalizer,
        );

  /// Returns the size in bytes.
  ///
  /// \return the size of the given block of data
  int get size => iTWBindings.TWDataSize(_pointer);

  /// Returns the raw pointer to the contents of data.
  Uint8List? bytes() => _pointer == nullptr
      ? null
      : iTWBindings.TWDataBytes(_pointer).asTypedList(size);

  /// Returns the hex string of data.
  String? hexString() =>
      _pointer == nullptr ? null : TWString.createWithHexData(this).value;

  /// Returns the byte at the provided index.
  ///
  /// \param [index] index of the byte that we want to fetch - index need to be < TWDataSize(data)
  /// \return the byte at the provided index
  int get(int index) => iTWBindings.TWDataGet(_pointer, index);

  /// Overloaded operator [], equivalent to [TWData.get].
  int operator [](int index) => get(index);

  /// Sets the byte at the provided index.
  ///
  /// \param [index] index of the byte that we want to set - index need to be < TWDataSize(data)
  /// \param [byte] Given byte to be written in data
  void set(int index, int byte) => iTWBindings.TWDataSet(_pointer, index, byte);

  /// Overloaded operator []=, equivalent to [TWData.set].
  void operator []=(int index, int byte) => set(index, byte);

  /// Copies a range of bytes into the provided buffer.
  ///
  /// \param [start] starting index of the range - index need to be < TWDataSize(data)
  /// \param [size] size of the range we want to copy - size need to be < TWDataSize(data) - start
  /// \return The output buffer where we want to copy the data.
  Uint8List copyBytes(int start, int size) {
    Pointer<Uint8> outputPointer = malloc.allocate<Uint8>(size);
    iTWBindings.TWDataCopyBytes(_pointer, start, size, outputPointer);
    final res = Uint8List.fromList(outputPointer.asTypedList(size));
    malloc.free(outputPointer);
    return res;
  }

  /// Replaces a range of bytes with the contents of the provided buffer.
  ///
  /// \param [start] starting index of the range - index need to be < TWDataSize(data)
  /// \param [size] size of the range we want to replace - size need to be < TWDataSize(data) - start
  /// \param [bytes] The buffer that will replace the range of data
  void replaceBytes(int start, int size, Uint8List bytes) =>
      iTWBindings.TWDataReplaceBytes(
          _pointer, start, size, bytes.toNativeUint8());

  /// Appends data from a byte array.
  ///
  /// \param [bytes] Non-null byte array
  /// \param [size] The size of the byte array
  void appendBytes(Uint8List bytes) => iTWBindings.TWDataAppendBytes(
      _pointer, bytes.toNativeUint8(), bytes.length);

  /// Appends a single byte.
  ///
  /// \param [byte] A single byte
  void appendByte(int byte) => iTWBindings.TWDataAppendByte(_pointer, byte);

  /// Appends a block of data.
  ///
  /// \param [append] A non-null valid block of data
  void appendData(TWData append) =>
      iTWBindings.TWDataAppendData(_pointer, append.pointer);

  /// Reverse the bytes.
  void reverse() => iTWBindings.TWDataReverse(_pointer);

  /// Sets all bytes to the given value.
  void reset() => iTWBindings.TWDataReset(_pointer);

  /// Deletes a block of data created with a `TWDataCreate*` method.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWDataDelete(_pointer);
  }

  /// Determines whether two data blocks are equal.
  ///
  /// \param [another] right non null block of data to be compared
  /// \return true if both block of data are equal, false otherwise
  bool equal(TWData another) =>
      iTWBindings.TWDataEqual(_pointer, another.pointer);

  /// Overloaded operator ==, equivalent to [TWData.equal].
  bool operator ==(Object other) => other is TWData && equal(other);
}

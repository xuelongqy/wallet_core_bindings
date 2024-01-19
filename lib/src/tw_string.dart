part of '../wallet_core_bindings.dart';

/// TWString finalizer.
final _twStringFinalizer = Finalizer<Pointer<Void>>((Pointer<Void> token) {
  iTWBindings.TWStringDelete(token);
});

/// Defines a resizable string.
///
/// The implementantion of these methods should be language-specific to minimize translation
/// overhead. For instance it should be a `jstring` for Java and an `NSString` for Swift. Create
/// allocates memory, the delete call should be called at the end to release memory.
class TWString extends TWObjectFinalizable<Void> {
  TWString.fromPointer(
    Pointer<Void> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twStringFinalizer);

  TWString(
    String value, {
    bool attach = true,
  }) : super(_create(value), attach: attach, finalizer: _twStringFinalizer);

  static Pointer<Void> _create(String value) {
    Pointer<Char> valuePointer = value.toNativeUtf8().cast();
    Pointer<Void> res = iTWBindings.TWStringCreateWithUTF8Bytes(valuePointer);
    malloc.free(valuePointer);
    return res;
  }

  /// Creates a TWString from a null-terminated UTF8 byte array. It must be deleted at the end.
  ///
  /// \param [bytes] a null-terminated UTF8 byte array.
  TWString.createWithUTF8Bytes(
    Pointer<Char> bytes, {
    bool attach = true,
  }) : super(iTWBindings.TWStringCreateWithUTF8Bytes(bytes),
            attach: attach, finalizer: _twStringFinalizer);

  /// Creates a string from a raw byte array and size. It must be deleted at the end.
  ///
  /// \param [bytes] a raw byte array.
  TWString.createWithRawBytes(
    Uint8List bytes, {
    bool attach = true,
  }) : super(_twStringCreateWithRawBytes(bytes),
            attach: attach, finalizer: _twStringFinalizer);

  static Pointer<Void> _twStringCreateWithRawBytes(Uint8List bytes) {
    Pointer<Uint8> bytesPointer = bytes.toNativeUint8();
    Pointer<Void> res =
        iTWBindings.TWStringCreateWithRawBytes(bytesPointer, bytes.length);
    malloc.free(bytesPointer);
    return res;
  }

  /// Creates a hexadecimal string from a block of data. It must be deleted at the end.
  ///
  /// \param [data] a block of data.
  TWString.createWithHexData(
    TWData data, {
    bool attach = true,
  }) : super(iTWBindings.TWStringCreateWithHexData(data.pointer),
            attach: attach, finalizer: _twStringFinalizer);

  /// Returns the string size in bytes.
  int size() => iTWBindings.TWStringSize(_pointer);

  /// Returns the byte at the provided index.
  ///
  /// \param [index] the index of the byte.
  String get(int index) =>
      String.fromCharCode(iTWBindings.TWStringGet(_pointer, index));

  /// Returns the raw pointer to the string's UTF8 bytes (null-terminated).
  Pointer<Char> utf8Bytes() => iTWBindings.TWStringUTF8Bytes(_pointer);

  @override
  String toString() {
    Pointer<Char> resPointer = utf8Bytes();
    String res = resPointer.cast<Utf8>().toDartString();
    //malloc.free(resPointer);
    return res;
  }

  /// Deletes a string created with a `TWStringCreate*` method and frees the memory.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWStringDelete(_pointer);
  }

  /// Determines whether two string blocks are equal.
  ///
  /// \param [another] Another TWString pointer.
  bool equal(TWString another) =>
      iTWBindings.TWStringEqual(_pointer, another.pointer);
}

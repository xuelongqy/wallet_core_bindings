part of '../wallet_core_bindings_native.dart';

class TwDataImpl extends TWDataInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TwDataImpl(this.bindings);

  @override
  void appendByte(int pointer, int byte) {
    bindings.TWDataAppendByte(Pointer.fromAddress(pointer), byte);
  }

  @override
  void appendBytes(int pointer, Uint8List bytes) {
    bindings.TWDataAppendBytes(
        Pointer.fromAddress(pointer), bytes.toNativeUint8(), bytes.length);
  }

  @override
  void appendData(int pointer, int append) {
    bindings.TWDataAppendData(
        Pointer.fromAddress(pointer), Pointer.fromAddress(append));
  }

  @override
  Uint8List bytes(int pointer) {
    return Uint8List.fromList(bindings.TWDataBytes(Pointer.fromAddress(pointer))
        .asTypedList(size(pointer)));
  }

  @override
  Uint8List copyBytes(int pointer, int start, int size) {
    Pointer<Uint8> outputPointer = malloc.allocate<Uint8>(size);
    bindings.TWDataCopyBytes(
        Pointer.fromAddress(pointer), start, size, outputPointer);
    final res = Uint8List.fromList(outputPointer.asTypedList(size));
    malloc.free(outputPointer);
    return res;
  }

  @override
  int createWithBytes(Uint8List bytes) {
    return bindings.TWDataCreateWithBytes(bytes.toNativeUint8(), bytes.length)
        .address;
  }

  @override
  int createWithData(int data) {
    return bindings.TWDataCreateWithData(Pointer.fromAddress(data)).address;
  }

  @override
  int createWithHexString(String hex) {
    return bindings.TWDataCreateWithHexString(
            Pointer.fromAddress(TWString(hex).pointer))
        .address;
  }

  @override
  int createWithSize(int size) {
    return bindings.TWDataCreateWithSize(size).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWDataDelete(Pointer.fromAddress(pointer));
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWDataEqual(
        Pointer.fromAddress(lhs), Pointer.fromAddress(rhs));
  }

  @override
  int get(int pointer, int index) {
    return bindings.TWDataGet(Pointer.fromAddress(pointer), index);
  }

  @override
  void replaceBytes(int pointer, int start, int size, Uint8List bytes) {
    return bindings.TWDataReplaceBytes(
        Pointer.fromAddress(pointer), start, size, bytes.toNativeUint8());
  }

  @override
  void reset(int pointer) {
    bindings.TWDataReset(Pointer.fromAddress(pointer));
  }

  @override
  void reverse(int pointer) {
    bindings.TWDataReverse(Pointer.fromAddress(pointer));
  }

  @override
  void set(int pointer, int index, int byte) {
    bindings.TWDataSet(Pointer.fromAddress(pointer), index, byte);
  }

  @override
  int size(int pointer) {
    return bindings.TWDataSize(Pointer.fromAddress(pointer));
  }
}

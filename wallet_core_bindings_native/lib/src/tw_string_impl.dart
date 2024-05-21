part of '../wallet_core_bindings_native.dart';

class TwStringImpl extends TWStringInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TwStringImpl(this.bindings);

  @override
  int create(String value) {
    Pointer<Char> valuePointer = value.toNativeUtf8().cast();
    Pointer<Void> res = bindings.TWStringCreateWithUTF8Bytes(valuePointer);
    malloc.free(valuePointer);
    return res.address;
  }

  @override
  int createWithHexData(int data) {
    return bindings.TWStringCreateWithHexData(Pointer.fromAddress(data))
        .address;
  }

  @override
  int createWithRawBytes(Uint8List bytes) {
    return bindings.TWStringCreateWithRawBytes(
            bytes.toNativeUint8(), bytes.length)
        .address;
  }

  @override
  int createWithUTF8Bytes(Uint8List bytes) {
    return bindings.TWStringCreateWithUTF8Bytes(bytes.toNativeUint8().cast())
        .address;
  }

  @override
  void delete(int pointer) {
    bindings.TWStringDelete(Pointer.fromAddress(pointer));
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWStringEqual(
        Pointer.fromAddress(lhs), Pointer.fromAddress(rhs));
  }

  @override
  int get(int pointer, int index) {
    return bindings.TWStringGet(Pointer.fromAddress(pointer), index);
  }

  @override
  int size(int pointer) {
    return bindings.TWStringSize(Pointer.fromAddress(pointer));
  }

  @override
  Uint8List utf8Bytes(int pointer) {
    return bindings.TWStringUTF8Bytes(Pointer.fromAddress(pointer))
        .cast<Uint8>()
        .asTypedList(size(pointer));
  }
}

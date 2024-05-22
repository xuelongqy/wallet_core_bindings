part of '../wallet_core_bindings_wasm.dart';

/// Native implementation for [TWString].
class TWStringImpl extends TWStringInterface {
  final WasmInstance wasm;

  TWStringImpl(this.wasm);

  @override
  int create(String value) {
    return createWithUTF8Bytes(utf8.encode(value));
  }

  @override
  int createWithHexData(int data) {
    final func = wasm.getFunction('TWStringCreateWithHexData')!;
    return func([data]).first as int;
  }

  @override
  int createWithRawBytes(Uint8List bytes) {
    final func = wasm.getFunction('TWStringCreateWithRawBytes')!;
    final bytesPointer = TWData(bytes).pointer;
    return func([bytesPointer, bytes.length]).first as int;
  }

  @override
  int createWithUTF8Bytes(Uint8List bytes) {
    final func = wasm.getFunction('TWStringCreateWithUTF8Bytes')!;
    final memory = wasm.getMemory('memory')!;
    final utf8Bytes = Uint8List.fromList(bytes.toList()..add(0));
    final size = utf8Bytes.length;
    final bytesPointer = wasm.malloc(size);
    memory.view.setRange(bytesPointer, bytesPointer + size, utf8Bytes);
    final pointer = func([bytesPointer]).first as int;
    wasm.free(bytesPointer);
    return pointer;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWStringDelete')!;
    func([pointer]);
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWStringEqual')!;
    return func([lhs, rhs]).first as int == 1;
  }

  @override
  int get(int pointer, int index) {
    final func = wasm.getFunction('TWStringGet')!;
    return func([pointer, index]).first as int;
  }

  @override
  int size(int pointer) {
    final func = wasm.getFunction('TWStringSize')!;
    return func([pointer]).first as int;
  }

  @override
  int utf8Bytes(int pointer) {
    final func = wasm.getFunction('TWStringUTF8Bytes')!;
    return func([pointer]).first as int;
  }

  @override
  Uint8List bytes(int pointer) {
    final memory = wasm.getMemory('memory')!;
    final bytesPointer = utf8Bytes(pointer);
    return memory.view.sublist(bytesPointer, bytesPointer + size(pointer));
  }
}

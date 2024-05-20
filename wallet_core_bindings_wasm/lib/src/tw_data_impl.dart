part of '../wallet_core_bindings_wasm.dart';

class TwDataImpl extends TWDataInterface {
  final WasmInstance wasm;

  TwDataImpl(this.wasm);

  @override
  void appendByte(int pointer, int byte) {
    final func = wasm.getFunction('TWDataAppendByte')!;
    func([pointer, byte]);
  }

  @override
  void appendBytes(int pointer, Uint8List bytes) {
    int append = createWithBytes(bytes);
    appendData(pointer, append);
    delete(append);
  }

  @override
  void appendData(int pointer, int append) {
    final func = wasm.getFunction('TWDataAppendData')!;
    func([pointer, append]);
  }

  @override
  Uint8List bytes(int pointer) {
    final func = wasm.getFunction('TWDataBytes')!;
    final memory = wasm.getMemory('memory')!;
    final bytesPointer = func([pointer]).first as int;
    return memory.view.sublist(bytesPointer, bytesPointer + size(pointer));
  }

  @override
  Uint8List copyBytes(int pointer, int start, int size) {
    return bytes(pointer).sublist(start, start + size);
  }

  @override
  int createWithBytes(Uint8List bytes) {
    final memory = wasm.getMemory('memory')!;
    final size = bytes.length;
    final pointer = createWithSize(size);
    memory.view.replaceRange(pointer, pointer + size, bytes);
    return pointer;
  }

  @override
  int createWithData(int data) {
    final func = wasm.getFunction('TWDataCreateWithData')!;
    return func([data]).first as int;
  }

  @override
  int createWithHexString(String hex) {
    final func = wasm.getFunction('TWDataCreateWithHexString')!;
    final stringPointer = TWString(hex).pointer;
    return func([stringPointer]).first as int;
  }

  @override
  int createWithSize(int size) {
    final func = wasm.getFunction('TWDataCreateWithSize')!;
    return func([size]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWDataDelete')!;
    func([pointer]);
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWDataEqual')!;
    return func([lhs, rhs]).first as int == 1;
  }

  @override
  int get(int pointer, int index) {
    final func = wasm.getFunction('TWDataGet')!;
    return func([pointer, index]).first as int;
  }

  @override
  void replaceBytes(int pointer, int start, int size, Uint8List bytes) {
    final memory = wasm.getMemory('memory')!;
    memory.view.replaceRange(pointer + start, pointer + start + size, bytes);
  }

  @override
  void reset(int pointer) {
    final func = wasm.getFunction('TWDataReset')!;
    func([pointer]);
  }

  @override
  void reverse(int pointer) {
    final func = wasm.getFunction('TWDataReverse')!;
    func([pointer]);
  }

  @override
  void set(int pointer, int index, int byte) {
    final func = wasm.getFunction('TWDataSet')!;
    func([pointer, index, byte]);
  }

  @override
  int size(int pointer) {
    final func = wasm.getFunction('TWDataSize')!;
    return func([pointer]).first as int;
  }
}

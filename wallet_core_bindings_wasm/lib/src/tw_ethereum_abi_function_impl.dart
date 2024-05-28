part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWEthereumAbiFunction].
class TWEthereumAbiFunctionImpl extends TWEthereumAbiFunctionInterface {
  final WasmInstance wasm;

  TWEthereumAbiFunctionImpl(this.wasm);

  @override
  int addInArrayParamAddress(int pointer, int arrayIdx, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamAddress')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamBool(int pointer, int arrayIdx, bool val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamBool')!;
    return func([pointer, arrayIdx, val ? 1 : 0]).first as int;
  }

  @override
  int addInArrayParamBytes(int pointer, int arrayIdx, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamBytes')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamBytesFix(int pointer, int arrayIdx, int size, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamBytesFix')!;
    return func([pointer, arrayIdx, size, val]).first as int;
  }

  @override
  int addInArrayParamInt16(int pointer, int arrayIdx, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamInt16')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamInt256(int pointer, int arrayIdx, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamInt256')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamInt32(int pointer, int arrayIdx, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamInt32')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamInt64(int pointer, int arrayIdx, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamInt64')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamInt8(int pointer, int arrayIdx, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamInt8')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamIntN(int pointer, int arrayIdx, int bits, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamIntN')!;
    return func([pointer, arrayIdx, bits, val]).first as int;
  }

  @override
  int addInArrayParamString(int pointer, int arrayIdx, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamString')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamUInt16(int pointer, int arrayIdx, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamUInt16')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamUInt256(int pointer, int arrayIdx, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamUInt256')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamUInt32(int pointer, int arrayIdx, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamUInt32')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamUInt64(int pointer, int arrayIdx, int val) {
    final func =
        wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamUInt64')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamUInt8(int pointer, int arrayIdx, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamUInt8')!;
    return func([pointer, arrayIdx, val]).first as int;
  }

  @override
  int addInArrayParamUIntN(int pointer, int arrayIdx, int bits, int val) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddInArrayParamUIntN')!;
    return func([pointer, arrayIdx, bits, val]).first as int;
  }

  @override
  int addParamAddress(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamAddress')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamArray(int pointer, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamArray')!;
    return func([pointer, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamBool(int pointer, bool val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamBool')!;
    return func([pointer, val ? 1 : 0, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamBytes(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamBytes')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamBytesFix(int pointer, int size, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamBytesFix')!;
    return func([pointer, size, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamInt16(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamInt16')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamInt256(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamInt256')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamInt32(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamInt32')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamInt64(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamInt64')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamInt8(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamInt8')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamIntN(int pointer, int bits, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamIntN')!;
    return func([pointer, bits, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamString(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamString')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamUInt16(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamUInt16')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamUInt256(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamUInt256')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamUInt32(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamUInt32')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamUInt64(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamUInt64')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamUInt8(int pointer, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamUInt8')!;
    return func([pointer, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int addParamUIntN(int pointer, int bits, int val, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionAddParamUIntN')!;
    return func([pointer, bits, val, isOutput ? 1 : 0]).first as int;
  }

  @override
  int createWithString(int name) {
    final func = wasm.getFunction('TWEthereumAbiFunctionCreateWithString')!;
    return func([name]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWEthereumAbiFunctionDelete')!;
    func([pointer]);
  }

  @override
  int getParamAddress(int pointer, int idx, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionGetParamAddress')!;
    return func([pointer, idx, isOutput ? 1 : 0]).first as int;
  }

  @override
  bool getParamBool(int pointer, int idx, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionGetParamBool')!;
    return (func([pointer, idx, isOutput ? 1 : 0]).first as int) != 0;
  }

  @override
  int getParamString(int pointer, int idx, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionGetParamString')!;
    return func([pointer, idx, isOutput ? 1 : 0]).first as int;
  }

  @override
  int getParamUInt256(int pointer, int idx, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionGetParamUInt256')!;
    return func([pointer, idx, isOutput ? 1 : 0]).first as int;
  }

  @override
  int getParamUInt64(int pointer, int idx, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionGetParamUInt64')!;
    return func([pointer, idx, isOutput ? 1 : 0]).first as int;
  }

  @override
  int getParamUInt8(int pointer, int idx, bool isOutput) {
    final func = wasm.getFunction('TWEthereumAbiFunctionGetParamUInt8')!;
    return func([pointer, idx, isOutput ? 1 : 0]).first as int;
  }

  @override
  int getType(int pointer) {
    final func = wasm.getFunction('TWEthereumAbiFunctionGetType')!;
    return func([pointer]).first as int;
  }
}

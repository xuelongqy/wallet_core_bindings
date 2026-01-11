part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWEthereumAbiFunction].
class TWEthereumAbiFunctionImpl extends TWEthereumAbiFunctionInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEthereumAbiFunctionImpl(this.bindings);

  @override
  int addInArrayParamAddress(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamAddress(
      Pointer.fromAddress(pointer),
      arrayIdx,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addInArrayParamBool(int pointer, int arrayIdx, bool val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamBool(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamBytes(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamBytes(
      Pointer.fromAddress(pointer),
      arrayIdx,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addInArrayParamBytesFix(int pointer, int arrayIdx, int size, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamBytesFix(
      Pointer.fromAddress(pointer),
      arrayIdx,
      size,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addInArrayParamInt16(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamInt16(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamInt256(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamInt256(
      Pointer.fromAddress(pointer),
      arrayIdx,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addInArrayParamInt32(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamInt32(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamInt64(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamInt64(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamInt8(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamInt8(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamIntN(int pointer, int arrayIdx, int bits, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamIntN(
      Pointer.fromAddress(pointer),
      arrayIdx,
      bits,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addInArrayParamString(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamString(
      Pointer.fromAddress(pointer),
      arrayIdx,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addInArrayParamUInt16(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamUInt16(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamUInt256(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamUInt256(
      Pointer.fromAddress(pointer),
      arrayIdx,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addInArrayParamUInt32(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamUInt32(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamUInt64(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamUInt64(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamUInt8(int pointer, int arrayIdx, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamUInt8(
      Pointer.fromAddress(pointer),
      arrayIdx,
      val,
    );
  }

  @override
  int addInArrayParamUIntN(int pointer, int arrayIdx, int bits, int val) {
    return bindings.TWEthereumAbiFunctionAddInArrayParamUIntN(
      Pointer.fromAddress(pointer),
      arrayIdx,
      bits,
      Pointer.fromAddress(val),
    );
  }

  @override
  int addParamAddress(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamAddress(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int addParamArray(int pointer, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamArray(
      Pointer.fromAddress(pointer),
      isOutput,
    );
  }

  @override
  int addParamBool(int pointer, bool val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamBool(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamBytes(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamBytes(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int addParamBytesFix(int pointer, int size, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamBytesFix(
      Pointer.fromAddress(pointer),
      size,
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int addParamInt16(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamInt16(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamInt256(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamInt256(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int addParamInt32(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamInt32(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamInt64(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamInt64(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamInt8(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamInt8(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamIntN(int pointer, int bits, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamIntN(
      Pointer.fromAddress(pointer),
      bits,
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int addParamString(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamString(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int addParamUInt16(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamUInt16(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamUInt256(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamUInt256(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int addParamUInt32(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamUInt32(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamUInt64(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamUInt64(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamUInt8(int pointer, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamUInt8(
      Pointer.fromAddress(pointer),
      val,
      isOutput,
    );
  }

  @override
  int addParamUIntN(int pointer, int bits, int val, bool isOutput) {
    return bindings.TWEthereumAbiFunctionAddParamUIntN(
      Pointer.fromAddress(pointer),
      bits,
      Pointer.fromAddress(val),
      isOutput,
    );
  }

  @override
  int createWithString(int name) {
    return bindings.TWEthereumAbiFunctionCreateWithString(
      Pointer.fromAddress(name),
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWEthereumAbiFunctionDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int getParamAddress(int pointer, int idx, bool isOutput) {
    return bindings.TWEthereumAbiFunctionGetParamAddress(
      Pointer.fromAddress(pointer),
      idx,
      isOutput,
    ).address;
  }

  @override
  bool getParamBool(int pointer, int idx, bool isOutput) {
    return bindings.TWEthereumAbiFunctionGetParamBool(
      Pointer.fromAddress(pointer),
      idx,
      isOutput,
    );
  }

  @override
  int getParamString(int pointer, int idx, bool isOutput) {
    return bindings.TWEthereumAbiFunctionGetParamString(
      Pointer.fromAddress(pointer),
      idx,
      isOutput,
    ).address;
  }

  @override
  int getParamUInt256(int pointer, int idx, bool isOutput) {
    return bindings.TWEthereumAbiFunctionGetParamUInt256(
      Pointer.fromAddress(pointer),
      idx,
      isOutput,
    ).address;
  }

  @override
  int getParamUInt64(int pointer, int idx, bool isOutput) {
    return bindings.TWEthereumAbiFunctionGetParamUInt64(
      Pointer.fromAddress(pointer),
      idx,
      isOutput,
    );
  }

  @override
  int getParamUInt8(int pointer, int idx, bool isOutput) {
    return bindings.TWEthereumAbiFunctionGetParamUInt8(
      Pointer.fromAddress(pointer),
      idx,
      isOutput,
    );
  }

  @override
  int getType(int pointer) {
    return bindings.TWEthereumAbiFunctionGetType(
      Pointer.fromAddress(pointer),
    ).address;
  }
}

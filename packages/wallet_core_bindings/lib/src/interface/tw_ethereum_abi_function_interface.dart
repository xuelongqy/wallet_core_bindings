part of '../../wallet_core_bindings.dart';

/// [TWEthereumAbiFunction] interface.
abstract class TWEthereumAbiFunctionInterface {
  int createWithString(int name);

  int getType(int pointer);

  int addParamUInt8(int pointer, int val, bool isOutput);

  int addParamUInt16(int pointer, int val, bool isOutput);

  int addParamUInt32(int pointer, int val, bool isOutput);

  int addParamUInt64(int pointer, int val, bool isOutput);

  int addParamUInt256(int pointer, int val, bool isOutput);

  int addParamUIntN(int pointer, int bits, int val, bool isOutput);

  int addParamInt8(int pointer, int val, bool isOutput);

  int addParamInt16(int pointer, int val, bool isOutput);

  int addParamInt32(int pointer, int val, bool isOutput);

  int addParamInt64(int pointer, int val, bool isOutput);

  int addParamInt256(int pointer, int val, bool isOutput);

  int addParamIntN(int pointer, int bits, int val, bool isOutput);

  int addParamBool(int pointer, bool val, bool isOutput);

  int addParamString(int pointer, int val, bool isOutput);

  int addParamAddress(int pointer, int val, bool isOutput);

  int addParamBytes(int pointer, int val, bool isOutput);

  int addParamBytesFix(int pointer, int size, int val, bool isOutput);

  int addParamArray(int pointer, bool isOutput);

  int getParamUInt8(int pointer, int idx, bool isOutput);

  int getParamUInt64(int pointer, int idx, bool isOutput);

  int getParamUInt256(int pointer, int idx, bool isOutput);

  bool getParamBool(int pointer, int idx, bool isOutput);

  int getParamString(int pointer, int idx, bool isOutput);

  int getParamAddress(int pointer, int idx, bool isOutput);

  int addInArrayParamUInt8(int pointer, int arrayIdx, int val);

  int addInArrayParamUInt16(int pointer, int arrayIdx, int val);

  int addInArrayParamUInt32(int pointer, int arrayIdx, int val);

  int addInArrayParamUInt64(int pointer, int arrayIdx, int val);

  int addInArrayParamUInt256(int pointer, int arrayIdx, int val);

  int addInArrayParamUIntN(int pointer, int arrayIdx, int bits, int val);

  int addInArrayParamInt8(int pointer, int arrayIdx, int val);

  int addInArrayParamInt16(int pointer, int arrayIdx, int val);

  int addInArrayParamInt32(int pointer, int arrayIdx, int val);

  int addInArrayParamInt64(int pointer, int arrayIdx, int val);

  int addInArrayParamInt256(int pointer, int arrayIdx, int val);

  int addInArrayParamIntN(int pointer, int arrayIdx, int bits, int val);

  int addInArrayParamBool(int pointer, int arrayIdx, bool val);

  int addInArrayParamString(int pointer, int arrayIdx, int val);

  int addInArrayParamAddress(int pointer, int arrayIdx, int val);

  int addInArrayParamBytes(int pointer, int arrayIdx, int val);

  int addInArrayParamBytesFix(int pointer, int arrayIdx, int size, int val);

  void delete(int pointer);
}

part of '../../wallet_core_bindings.dart';

/// [TWEthereumAbiValue] interface.
abstract class TWEthereumAbiValueInterface {
  int encodeBool(bool value);

  int encodeInt32(int value);

  int encodeUInt32(int value);

  int encodeInt256(int value);

  int encodeUInt256(int value);

  int encodeAddress(int value);

  int encodeString(int value);

  int encodeBytes(int value);

  int encodeBytesDyn(int value);

  int decodeUInt256(int value);

  int decodeValue(int input, int type);

  int decodeArray(int input, int type);
}

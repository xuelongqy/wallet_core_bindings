part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWEthereumAbiValue].
class TWEthereumAbiValueImpl extends TWEthereumAbiValueInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEthereumAbiValueImpl(this.bindings);

  @override
  int decodeArray(int input, int type) {
    return bindings.TWEthereumAbiValueDecodeArray(
      Pointer.fromAddress(input),
      Pointer.fromAddress(type),
    ).address;
  }

  @override
  int decodeUInt256(int value) {
    return bindings.TWEthereumAbiValueDecodeUInt256(
      Pointer.fromAddress(value),
    ).address;
  }

  @override
  int decodeValue(int input, int type) {
    return bindings.TWEthereumAbiValueDecodeValue(
      Pointer.fromAddress(input),
      Pointer.fromAddress(type),
    ).address;
  }

  @override
  int encodeAddress(int value) {
    return bindings.TWEthereumAbiValueEncodeAddress(
      Pointer.fromAddress(value),
    ).address;
  }

  @override
  int encodeBool(bool value) {
    return bindings.TWEthereumAbiValueEncodeBool(
      value,
    ).address;
  }

  @override
  int encodeBytes(int value) {
    return bindings.TWEthereumAbiValueEncodeBytes(
      Pointer.fromAddress(value),
    ).address;
  }

  @override
  int encodeBytesDyn(int value) {
    return bindings.TWEthereumAbiValueEncodeBytesDyn(
      Pointer.fromAddress(value),
    ).address;
  }

  @override
  int encodeInt256(int value) {
    return bindings.TWEthereumAbiValueEncodeInt256(
      Pointer.fromAddress(value),
    ).address;
  }

  @override
  int encodeInt32(int value) {
    return bindings.TWEthereumAbiValueEncodeInt32(
      value,
    ).address;
  }

  @override
  int encodeString(int value) {
    return bindings.TWEthereumAbiValueEncodeString(
      Pointer.fromAddress(value),
    ).address;
  }

  @override
  int encodeUInt256(int value) {
    return bindings.TWEthereumAbiValueEncodeUInt256(
      Pointer.fromAddress(value),
    ).address;
  }

  @override
  int encodeUInt32(int value) {
    return bindings.TWEthereumAbiValueEncodeUInt32(
      value,
    ).address;
  }
}

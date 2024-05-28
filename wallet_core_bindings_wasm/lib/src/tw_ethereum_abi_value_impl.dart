part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWEthereumAbiValue].
class TWEthereumAbiValueImpl extends TWEthereumAbiValueInterface {
  final WasmInstance wasm;

  TWEthereumAbiValueImpl(this.wasm);

  @override
  int decodeArray(int input, int type) {
    final func = wasm.getFunction('TWEthereumAbiValueDecodeArray')!;
    return func([input, type]).first as int;
  }

  @override
  int decodeUInt256(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueDecodeUInt256')!;
    return func([value]).first as int;
  }

  @override
  int decodeValue(int input, int type) {
    final func = wasm.getFunction('TWEthereumAbiValueDecodeValue')!;
    return func([input, type]).first as int;
  }

  @override
  int encodeAddress(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeAddress')!;
    return func([value]).first as int;
  }

  @override
  int encodeBool(bool value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeBool')!;
    return func([value ? 1 : 0]).first as int;
  }

  @override
  int encodeBytes(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeBytes')!;
    return func([value]).first as int;
  }

  @override
  int encodeBytesDyn(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeBytesDyn')!;
    return func([value]).first as int;
  }

  @override
  int encodeInt256(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeInt256')!;
    return func([value]).first as int;
  }

  @override
  int encodeInt32(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeInt32')!;
    return func([value]).first as int;
  }

  @override
  int encodeString(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeString')!;
    return func([value]).first as int;
  }

  @override
  int encodeUInt256(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeUInt256')!;
    return func([value]).first as int;
  }

  @override
  int encodeUInt32(int value) {
    final func = wasm.getFunction('TWEthereumAbiValueEncodeUInt32')!;
    return func([value]).first as int;
  }
}

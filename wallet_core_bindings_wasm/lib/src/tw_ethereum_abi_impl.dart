part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWEthereumAbi].
class TWEthereumAbiImpl extends TWEthereumAbiInterface {
  final WasmInstance wasm;

  TWEthereumAbiImpl(this.wasm);

  @override
  int decodeCall(int data, int abi) {
    final func = wasm.getFunction('TWEthereumAbiDecodeCall')!;
    return func([data, abi]).first as int;
  }

  @override
  int decodeContractCall(int coin, int input) {
    final func = wasm.getFunction('TWEthereumAbiDecodeContractCall')!;
    return func([coin, input]).first as int;
  }

  @override
  bool decodeOutput(int fn, int encoded) {
    final func = wasm.getFunction('TWEthereumAbiDecodeOutput')!;
    return (func([fn, encoded]).first as int) != 0;
  }

  @override
  int decodeParams(int coin, int input) {
    final func = wasm.getFunction('TWEthereumAbiDecodeParams')!;
    return func([coin, input]).first as int;
  }

  @override
  int decodeValue(int coin, int input) {
    final func = wasm.getFunction('TWEthereumAbiDecodeValue')!;
    return func([coin, input]).first as int;
  }

  @override
  int encode(int fn) {
    final func = wasm.getFunction('TWEthereumAbiEncode')!;
    return func([fn]).first as int;
  }

  @override
  int encodeFunction(int coin, int input) {
    final func = wasm.getFunction('TWEthereumAbiEncodeFunction')!;
    return func([coin, input]).first as int;
  }

  @override
  int encodeTyped(int messageJson) {
    final func = wasm.getFunction('TWEthereumAbiEncodeTyped')!;
    return func([messageJson]).first as int;
  }

  @override
  int getFunctionSignature(int abi) {
    final func = wasm.getFunction('TWEthereumAbiGetFunctionSignature')!;
    return func([abi]).first as int;
  }
}

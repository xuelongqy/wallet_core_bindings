part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWEthereumAbi].
class TWEthereumAbiImpl extends TWEthereumAbiInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEthereumAbiImpl(this.bindings);

  @override
  int decodeCall(int data, int abi) {
    return bindings.TWEthereumAbiDecodeCall(
      Pointer.fromAddress(data),
      Pointer.fromAddress(abi),
    ).address;
  }

  @override
  int decodeContractCall(int coin, int input) {
    return bindings.TWEthereumAbiDecodeContractCall(
      coin,
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  bool decodeOutput(int fn, int encoded) {
    return bindings.TWEthereumAbiDecodeOutput(
      Pointer.fromAddress(fn),
      Pointer.fromAddress(encoded),
    );
  }

  @override
  int decodeParams(int coin, int input) {
    return bindings.TWEthereumAbiDecodeParams(
      coin,
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  int decodeValue(int coin, int input) {
    return bindings.TWEthereumAbiDecodeValue(
      coin,
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  int encode(int fn) {
    return bindings.TWEthereumAbiEncode(
      Pointer.fromAddress(fn),
    ).address;
  }

  @override
  int encodeFunction(int coin, int input) {
    return bindings.TWEthereumAbiEncodeFunction(
      coin,
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  int encodeTyped(int messageJson) {
    return bindings.TWEthereumAbiEncodeTyped(
      Pointer.fromAddress(messageJson),
    ).address;
  }
}

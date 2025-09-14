part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWEthereum].
class TWEthereumImpl extends TWEthereumInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEthereumImpl(this.bindings);

  @override
  int addressChecksummed(int address) {
    return bindings.TWEthereumAddressChecksummed(
      Pointer.fromAddress(address),
    ).address;
  }

  @override
  int eip2645GetPath(int ethAddress, int layer, int application, int index) {
    return bindings.TWEthereumEip2645GetPath(
      Pointer.fromAddress(ethAddress),
      Pointer.fromAddress(layer),
      Pointer.fromAddress(application),
      Pointer.fromAddress(index),
    ).address;
  }

  @override
  int eip1014Create2Address(int from, int salt, int initCodeHash) {
    return bindings.TWEthereumEip1014Create2Address(
      Pointer.fromAddress(from),
      Pointer.fromAddress(salt),
      Pointer.fromAddress(initCodeHash),
    ).address;
  }

  @override
  int eip1967ProxyInitCode(int logicAddress, int data) {
    return bindings.TWEthereumEip1967ProxyInitCode(
      Pointer.fromAddress(logicAddress),
      Pointer.fromAddress(data),
    ).address;
  }
}

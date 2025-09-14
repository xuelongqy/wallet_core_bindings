part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWEthereum].
class TWEthereumImpl extends TWEthereumInterface {
  final WasmInstance wasm;

  TWEthereumImpl(this.wasm);

  @override
  int addressChecksummed(int address) {
    final func = wasm.getFunction('TWEthereumAddressChecksummed')!;
    return func([address]).first as int;
  }

  @override
  int eip2645GetPath(int ethAddress, int layer, int application, int index) {
    final func = wasm.getFunction('TWEthereumEip2645GetPath')!;
    return func([ethAddress, layer, application, index]).first as int;
  }

  @override
  int eip1014Create2Address(int from, int salt, int initCodeHash) {
    final func = wasm.getFunction('TWEthereumEip1014Create2Address')!;
    return func([from, salt, initCodeHash]).first as int;
  }

  @override
  int eip1967ProxyInitCode(int logicAddress, int data) {
    final func = wasm.getFunction('TWEthereumEip1967ProxyInitCode')!;
    return func([logicAddress, data]).first as int;
  }
}

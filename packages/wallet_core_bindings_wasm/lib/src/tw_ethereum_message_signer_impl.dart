part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWEthereumMessageSigner].
class TWEthereumMessageSignerImpl extends TWEthereumMessageSignerInterface {
  final WasmInstance wasm;

  TWEthereumMessageSignerImpl(this.wasm);

  @override
  int signMessage(int privateKey, int message) {
    final func = wasm.getFunction('TWEthereumMessageSignerSignMessage')!;
    return func([privateKey, message]).first as int;
  }

  @override
  int signMessageEip155(int privateKey, int message, int chainId) {
    final func = wasm.getFunction('TWEthereumMessageSignerSignMessageEip155')!;
    return func([privateKey, message, chainId]).first as int;
  }

  @override
  int signMessageImmutableX(int privateKey, int message) {
    final func =
        wasm.getFunction('TWEthereumMessageSignerSignMessageImmutableX')!;
    return func([privateKey, message]).first as int;
  }

  @override
  int signTypedMessage(int privateKey, int messageJson) {
    final func = wasm.getFunction('TWEthereumMessageSignerSignTypedMessage')!;
    return func([privateKey, messageJson]).first as int;
  }

  @override
  int signTypedMessageEip155(int privateKey, int messageJson, int chainId) {
    final func =
        wasm.getFunction('TWEthereumMessageSignerSignTypedMessageEip155')!;
    return func([privateKey, messageJson, chainId]).first as int;
  }

  @override
  bool verifyMessage(int pubKey, int message, int signature) {
    final func = wasm.getFunction('TWEthereumMessageSignerVerifyMessage')!;
    return (func([pubKey, message, signature]).first as int) != 0;
  }
}

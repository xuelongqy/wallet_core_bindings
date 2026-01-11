part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWEthereumMessageSigner].
class TWEthereumMessageSignerImpl extends TWEthereumMessageSignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEthereumMessageSignerImpl(this.bindings);

  @override
  int signMessage(int privateKey, int message) {
    return bindings.TWEthereumMessageSignerSignMessage(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(message),
    ).address;
  }

  @override
  int signMessageEip155(int privateKey, int message, int chainId) {
    return bindings.TWEthereumMessageSignerSignMessageEip155(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(message),
      chainId,
    ).address;
  }

  @override
  int signMessageImmutableX(int privateKey, int message) {
    return bindings.TWEthereumMessageSignerSignMessageImmutableX(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(message),
    ).address;
  }

  @override
  int signTypedMessage(int privateKey, int messageJson) {
    return bindings.TWEthereumMessageSignerSignTypedMessage(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(messageJson),
    ).address;
  }

  @override
  int signTypedMessageEip155(int privateKey, int messageJson, int chainId) {
    return bindings.TWEthereumMessageSignerSignTypedMessageEip155(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(messageJson),
      chainId,
    ).address;
  }

  @override
  bool verifyMessage(int pubKey, int message, int signature) {
    return bindings.TWEthereumMessageSignerVerifyMessage(
      Pointer.fromAddress(pubKey),
      Pointer.fromAddress(message),
      Pointer.fromAddress(signature),
    );
  }
}

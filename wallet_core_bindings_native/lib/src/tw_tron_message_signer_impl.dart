part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTronMessageSigner].
class TWTronMessageSignerImpl extends TWTronMessageSignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTronMessageSignerImpl(this.bindings);

  @override
  int signMessage(int privateKey, int message) {
    return bindings.TWTronMessageSignerSignMessage(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(message),
    ).address;
  }

  @override
  bool verifyMessage(int pubKey, int message, int signature) {
    return bindings.TWTronMessageSignerVerifyMessage(
      Pointer.fromAddress(pubKey),
      Pointer.fromAddress(message),
      Pointer.fromAddress(signature),
    );
  }
}

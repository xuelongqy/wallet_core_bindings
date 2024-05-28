part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTezosMessageSigner].
class TWTezosMessageSignerImpl extends TWTezosMessageSignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTezosMessageSignerImpl(this.bindings);

  @override
  int formatMessage(int message, int url) {
    return bindings.TWTezosMessageSignerFormatMessage(
      Pointer.fromAddress(message),
      Pointer.fromAddress(url),
    ).address;
  }

  @override
  int inputToPayload(int message) {
    return bindings.TWTezosMessageSignerInputToPayload(
      Pointer.fromAddress(message),
    ).address;
  }

  @override
  int signMessage(int privateKey, int message) {
    return bindings.TWTezosMessageSignerSignMessage(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(message),
    ).address;
  }

  @override
  bool verifyMessage(int pubKey, int message, int signature) {
    return bindings.TWTezosMessageSignerVerifyMessage(
      Pointer.fromAddress(pubKey),
      Pointer.fromAddress(message),
      Pointer.fromAddress(signature),
    );
  }
}

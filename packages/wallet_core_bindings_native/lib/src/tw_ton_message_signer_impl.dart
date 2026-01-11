part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTONMessageSigner].
class TWTONMessageSignerImpl extends TWTONMessageSignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTONMessageSignerImpl(this.bindings);

  @override
  int signMessage(int privateKey, int message) {
    return bindings.TWTONMessageSignerSignMessage(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(message),
    ).address;
  }
}

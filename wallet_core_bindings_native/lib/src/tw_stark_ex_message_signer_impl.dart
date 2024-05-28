part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWStarkExMessageSigner].
class TWStarkExMessageSignerImpl extends TWStarkExMessageSignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWStarkExMessageSignerImpl(this.bindings);

  @override
  int signMessage(int privateKey, int message) {
    return bindings.TWStarkExMessageSignerSignMessage(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(message),
    ).address;
  }

  @override
  bool verifyMessage(int publicKey, int message, int signature) {
    return bindings.TWStarkExMessageSignerVerifyMessage(
      Pointer.fromAddress(publicKey),
      Pointer.fromAddress(message),
      Pointer.fromAddress(signature),
    );
  }
}

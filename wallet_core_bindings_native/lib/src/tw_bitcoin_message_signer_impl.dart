part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWBitcoinMessageSigner].
class TWBitcoinMessageSignerImpl extends TWBitcoinMessageSignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBitcoinMessageSignerImpl(this.bindings);

  @override
  int signMessage(int privateKey, int address, int message) {
    return bindings.TWBitcoinMessageSignerSignMessage(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(address),
      Pointer.fromAddress(message),
    ).address;
  }

  @override
  bool verifyMessage(int address, int message, int signature) {
    return bindings.TWBitcoinMessageSignerVerifyMessage(
      Pointer.fromAddress(address),
      Pointer.fromAddress(message),
      Pointer.fromAddress(signature),
    );
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWWebAuthn].
class TWWebAuthnImpl extends TWWebAuthnInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWWebAuthnImpl(this.bindings);

  @override
  int getPublicKey(int attestationObject) {
    return bindings.TWWebAuthnGetPublicKey(
      Pointer.fromAddress(attestationObject),
    ).address;
  }

  @override
  int getRSValues(int signature) {
    return bindings.TWWebAuthnGetRSValues(
      Pointer.fromAddress(signature),
    ).address;
  }

  @override
  int reconstructOriginalMessage(int authenticatorData, int clientDataJSON) {
    return bindings.TWWebAuthnReconstructOriginalMessage(
      Pointer.fromAddress(authenticatorData),
      Pointer.fromAddress(clientDataJSON),
    ).address;
  }
}

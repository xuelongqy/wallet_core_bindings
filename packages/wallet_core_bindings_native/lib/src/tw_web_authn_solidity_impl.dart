part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWWebAuthnSolidity].
class TWWebAuthnSolidityImpl implements TWWebAuthnSolidityInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWWebAuthnSolidityImpl(this.bindings);

  @override
  int getMessageHash(int authenticatorData, int clientDataJson) {
    return bindings.TWWebAuthnSolidityGetMessageHash(
      Pointer.fromAddress(authenticatorData),
      Pointer.fromAddress(clientDataJson),
    ).address;
  }

  @override
  int getFormattedSignature(
      int authenticatorData, int clientDataJson, int derSignature) {
    return bindings.TWWebAuthnSolidityGetFormattedSignature(
      Pointer.fromAddress(authenticatorData),
      Pointer.fromAddress(clientDataJson),
      Pointer.fromAddress(derSignature),
    ).address;
  }
}

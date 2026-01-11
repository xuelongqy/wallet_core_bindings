part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWWebAuthn].
class TWWebAuthnImpl extends TWWebAuthnInterface {
  final WasmInstance wasm;

  TWWebAuthnImpl(this.wasm);

  @override
  int getPublicKey(int attestationObject) {
    final func = wasm.getFunction('TWWebAuthnGetPublicKey')!;
    return func([attestationObject]).first as int;
  }

  @override
  int getRSValues(int signature) {
    final func = wasm.getFunction('TWWebAuthnGetRSValues')!;
    return func([signature]).first as int;
  }

  @override
  int reconstructOriginalMessage(int authenticatorData, int clientDataJSON) {
    final func = wasm.getFunction('TWWebAuthnReconstructOriginalMessage')!;
    return func([authenticatorData, clientDataJSON]).first as int;
  }
}

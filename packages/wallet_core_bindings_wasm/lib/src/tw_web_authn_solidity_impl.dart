part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWWebAuthnSolidity].
class TWWebAuthnSolidityImpl implements TWWebAuthnSolidityInterface {
  final WasmInstance wasm;

  TWWebAuthnSolidityImpl(this.wasm);

  @override
  int getMessageHash(int authenticatorData, int clientDataJson) {
    final func = wasm.getFunction('TWWebAuthnSolidityGetMessageHash')!;
    return func([authenticatorData, clientDataJson]) as int;
  }

  @override
  int getFormattedSignature(
      int authenticatorData, int clientDataJson, int derSignature) {
    final func = wasm.getFunction('TWWebAuthnSolidityGetFormattedSignature')!;
    return func([authenticatorData, clientDataJson, derSignature]) as int;
  }
}

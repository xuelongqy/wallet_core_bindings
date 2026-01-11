part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWBarz].
class TWBarzImpl implements TWBarzInterface {
  final WasmInstance wasm;

  TWBarzImpl(this.wasm);

  @override
  int getCounterfactualAddress(int input) {
    final func = wasm.getFunction('TWBarzGetCounterfactualAddress')!;
    return func([input]).first as int;
  }

  @override
  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId) {
    final func = wasm.getFunction('TWBarzGetPrefixedMsgHash')!;
    return func([msgHash, barzAddress, chainId]).first as int;
  }

  @override
  int getInitCode(int factory, int publicKey, int verificationFacet, int salt) {
    final func = wasm.getFunction('TWBarzGetInitCode')!;
    return func([factory, publicKey, verificationFacet, salt]).first as int;
  }

  @override
  int getFormattedSignature(
      int signature, int challenge, int authenticatorData, int clientDataJSON) {
    final func = wasm.getFunction('TWBarzGetFormattedSignature')!;
    return func([signature, challenge, authenticatorData, clientDataJSON]).first
        as int;
  }

  @override
  int getDiamondCutCode(int input) {
    final func = wasm.getFunction('TWBarzGetDiamondCutCode')!;
    return func([input]).first as int;
  }
}

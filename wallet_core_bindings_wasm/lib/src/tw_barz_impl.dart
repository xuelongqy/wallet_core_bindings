part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWBarz].
class TWBarzImpl extends TWBarzInterface {
  final WasmInstance wasm;

  TWBarzImpl(this.wasm);

  @override
  int getCounterfactualAddress(int input) {
    final func = wasm.getFunction('TWBarzGetCounterfactualAddress')!;
    return func([input]).first as int;
  }

  @override
  int getDiamondCutCode(int input) {
    final func = wasm.getFunction('TWBarzGetDiamondCutCode')!;
    return func([input]).first as int;
  }

  @override
  int getFormattedSignature(
      int signature, int challenge, int authenticatorData, int clientDataJSON) {
    final func = wasm.getFunction('TWBarzGetFormattedSignature')!;
    return func([signature, challenge, authenticatorData, clientDataJSON]).first
        as int;
  }

  @override
  int getInitCode(int factory, int publicKey, int verificationFacet, int salt) {
    final func = wasm.getFunction('TWBarzGetInitCode')!;
    return func([factory, publicKey, verificationFacet, salt]).first as int;
  }

  @override
  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId) {
    final func = wasm.getFunction('TWBarzGetPrefixedMsgHash')!;
    return func([msgHash, barzAddress, chainId]).first as int;
  }

  @override
  int getAuthorizationHash(int chainId, int contractAddress, int nonce) {
    final func = wasm.getFunction('TWBarzGetAuthorizationHash')!;
    return func([chainId, contractAddress, nonce]).first as int;
  }

  @override
  int getSignedHash(int hash, int privateKey) {
    final func = wasm.getFunction('TWBarzGetSignedHash')!;
    return func([hash, privateKey]).first as int;
  }

  @override
  int signAuthorization(
      int chainId, int contractAddress, int nonce, int privateKey) {
    final func = wasm.getFunction('TWBarzSignAuthorization')!;
    return func([chainId, contractAddress, nonce, privateKey]).first as int;
  }

  @override
  int getEncodedHash(
      int chainId,
      int codeAddress,
      int codeName,
      int codeVersion,
      int typeHash,
      int domainSeparatorHash,
      int sender,
      int userOpHash) {
    final func = wasm.getFunction('TWBarzGetEncodedHash')!;
    return func([
      chainId,
      codeAddress,
      codeName,
      codeVersion,
      typeHash,
      domainSeparatorHash,
      sender,
      userOpHash
    ]).first as int;
  }
}

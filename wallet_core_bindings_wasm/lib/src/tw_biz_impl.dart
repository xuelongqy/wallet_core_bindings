part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWBiz].
class TWBizImpl implements TWBizInterface {
  final WasmInstance wasm;

  TWBizImpl(this.wasm);

  @override
  int getEncodedHash(
    int chainId,
    int codeAddress,
    int codeName,
    int codeVersion,
    int typeHash,
    int domainSeparatorHash,
    int sender,
    int userOpHash,
  ) {
    final func = wasm.getFunction('TWBizGetEncodedHash')!;
    return func([
      chainId,
      codeAddress,
      codeName,
      codeVersion,
      typeHash,
      domainSeparatorHash,
      sender,
      userOpHash,
    ]).first as int;
  }

  @override
  int getSignedHash(int hash, int privateKey) {
    final func = wasm.getFunction('TWBizGetSignedHash')!;
    return func([hash, privateKey]).first as int;
  }

  @override
  int encodeRegisterSessionCall(
      int sessionPasskeyPublicKey, int validUntilTimestamp) {
    final func = wasm.getFunction('TWBizEncodeRegisterSessionCall')!;
    return func([sessionPasskeyPublicKey, validUntilTimestamp]).first as int;
  }

  @override
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey) {
    final func = wasm.getFunction('TWBizEncodeRemoveSessionCall')!;
    return func([sessionPasskeyPublicKey]).first as int;
  }

  @override
  int encodePasskeySessionNonce(int nonce) {
    final func = wasm.getFunction('TWBizEncodePasskeySessionNonce')!;
    return func([nonce]).first as int;
  }

  @override
  int encodeExecuteWithPasskeySessionCall(int input) {
    final func = wasm.getFunction('TWBizEncodeExecuteWithPasskeySessionCall')!;
    return func([input]).first as int;
  }
}

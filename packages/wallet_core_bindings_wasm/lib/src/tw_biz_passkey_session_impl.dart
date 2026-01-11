part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWBizPasskeySession].
class TWBizPasskeySessionImpl implements TWBizPasskeySessionInterface {
  final WasmInstance wasm;

  TWBizPasskeySessionImpl(this.wasm);

  @override
  int encodeRegisterSessionCall(
      int sessionPasskeyPublicKey, int validUntilTimestamp) {
    final func =
        wasm.getFunction('TWBizPasskeySessionEncodeRegisterSessionCall')!;
    return func([sessionPasskeyPublicKey, validUntilTimestamp]).first as int;
  }

  @override
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey) {
    final func =
        wasm.getFunction('TWBizPasskeySessionEncodeRemoveSessionCall')!;
    return func([sessionPasskeyPublicKey]).first as int;
  }

  @override
  int encodePasskeySessionNonce(int nonce) {
    final func =
        wasm.getFunction('TWBizPasskeySessionEncodePasskeySessionNonce')!;
    return func([nonce]).first as int;
  }

  @override
  int encodeExecuteWithPasskeySessionCall(int input) {
    final func = wasm
        .getFunction('TWBizPasskeySessionEncodeExecuteWithPasskeySessionCall')!;
    return func([input]).first as int;
  }

  @override
  int signExecuteWithSignatureCall(int input) {
    final func =
        wasm.getFunction('TWBizPasskeySessionSignExecuteWithSignatureCall')!;
    return func([input]).first as int;
  }
}

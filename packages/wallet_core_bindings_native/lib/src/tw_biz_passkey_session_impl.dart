part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBizPasskeySession].
class TWBizPasskeySessionImpl implements TWBizPasskeySessionInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBizPasskeySessionImpl(this.bindings);

  @override
  int encodeRegisterSessionCall(
      int sessionPasskeyPublicKey, int validUntilTimestamp) {
    return bindings.TWBizPasskeySessionEncodeRegisterSessionCall(
      Pointer.fromAddress(sessionPasskeyPublicKey),
      Pointer.fromAddress(validUntilTimestamp),
    ).address;
  }

  @override
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey) {
    return bindings.TWBizPasskeySessionEncodeRemoveSessionCall(
      Pointer.fromAddress(sessionPasskeyPublicKey),
    ).address;
  }

  @override
  int encodePasskeySessionNonce(int nonce) {
    return bindings.TWBizPasskeySessionEncodePasskeySessionNonce(
      Pointer.fromAddress(nonce),
    ).address;
  }

  @override
  int encodeExecuteWithPasskeySessionCall(int input) {
    return bindings.TWBizPasskeySessionEncodeExecuteWithPasskeySessionCall(
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  int signExecuteWithSignatureCall(int input) {
    return bindings.TWBizPasskeySessionSignExecuteWithSignatureCall(
      Pointer.fromAddress(input),
    ).address;
  }
}

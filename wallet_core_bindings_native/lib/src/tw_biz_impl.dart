part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBiz].
class TWBizImpl implements TWBizInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBizImpl(this.bindings);

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
    return bindings.TWBizGetEncodedHash(
      Pointer.fromAddress(chainId),
      Pointer.fromAddress(codeAddress),
      Pointer.fromAddress(codeName),
      Pointer.fromAddress(codeVersion),
      Pointer.fromAddress(typeHash),
      Pointer.fromAddress(domainSeparatorHash),
      Pointer.fromAddress(sender),
      Pointer.fromAddress(userOpHash),
    ).address;
  }

  @override
  int getSignedHash(int hash, int privateKey) {
    return bindings.TWBizGetSignedHash(
      Pointer.fromAddress(hash),
      Pointer.fromAddress(privateKey),
    ).address;
  }

  @override
  int encodeRegisterSessionCall(
      int sessionPasskeyPublicKey, int validUntilTimestamp) {
    return bindings.TWBizEncodeRegisterSessionCall(
      Pointer.fromAddress(sessionPasskeyPublicKey),
      Pointer.fromAddress(validUntilTimestamp),
    ).address;
  }

  @override
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey) {
    return bindings.TWBizEncodeRemoveSessionCall(
      Pointer.fromAddress(sessionPasskeyPublicKey),
    ).address;
  }

  @override
  int encodePasskeySessionNonce(int nonce) {
    return bindings.TWBizEncodePasskeySessionNonce(
      Pointer.fromAddress(nonce),
    ).address;
  }

  @override
  int encodeExecuteWithPasskeySessionCall(int input) {
    return bindings.TWBizEncodeExecuteWithPasskeySessionCall(
      Pointer.fromAddress(input),
    ).address;
  }
}

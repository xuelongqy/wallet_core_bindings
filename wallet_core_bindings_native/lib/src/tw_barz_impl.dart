part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBarz].
class TWBarzImpl extends TWBarzInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBarzImpl(this.bindings);

  @override
  int getCounterfactualAddress(int input) {
    return bindings.TWBarzGetCounterfactualAddress(
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  int getDiamondCutCode(int input) {
    return bindings.TWBarzGetDiamondCutCode(
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  int getFormattedSignature(
      int signature, int challenge, int authenticatorData, int clientDataJSON) {
    return bindings.TWBarzGetFormattedSignature(
      Pointer.fromAddress(signature),
      Pointer.fromAddress(challenge),
      Pointer.fromAddress(authenticatorData),
      Pointer.fromAddress(clientDataJSON),
    ).address;
  }

  @override
  int getInitCode(int factory, int publicKey, int verificationFacet, int salt) {
    return bindings.TWBarzGetInitCode(
      Pointer.fromAddress(factory),
      Pointer.fromAddress(publicKey),
      Pointer.fromAddress(verificationFacet),
      salt,
    ).address;
  }

  @override
  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId) {
    return bindings.TWBarzGetPrefixedMsgHash(
      Pointer.fromAddress(msgHash),
      Pointer.fromAddress(barzAddress),
      chainId,
    ).address;
  }

  @override
  int getAuthorizationHash(int chainId, int contractAddress, int nonce) {
    return bindings.TWBarzGetAuthorizationHash(
      Pointer.fromAddress(chainId),
      Pointer.fromAddress(contractAddress),
      Pointer.fromAddress(nonce),
    ).address;
  }

  @override
  int getEncodedHash(int chainId, int wallet, int version, int typeHash,
      int domainSeparatorHash, int hash) {
    return bindings.TWBarzGetEncodedHash(
      Pointer.fromAddress(chainId),
      Pointer.fromAddress(wallet),
      Pointer.fromAddress(version),
      Pointer.fromAddress(typeHash),
      Pointer.fromAddress(domainSeparatorHash),
      Pointer.fromAddress(hash),
    ).address;
  }

  @override
  int getSignedHash(int hash, int privateKey) {
    return bindings.TWBarzGetSignedHash(
      Pointer.fromAddress(hash),
      Pointer.fromAddress(privateKey),
    ).address;
  }

  @override
  int signAuthorization(
      int chainId, int contractAddress, int nonce, int privateKey) {
    return bindings.TWBarzSignAuthorization(
      Pointer.fromAddress(chainId),
      Pointer.fromAddress(contractAddress),
      Pointer.fromAddress(nonce),
      Pointer.fromAddress(privateKey),
    ).address;
  }
}

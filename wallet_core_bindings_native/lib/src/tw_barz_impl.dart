part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBarz].
class TWBarzImpl implements TWBarzInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBarzImpl(this.bindings);

  @override
  int getCounterfactualAddress(int input) {
    return bindings.TWBarzGetCounterfactualAddress(
      Pointer.fromAddress(input),
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
  int getInitCode(int factory, int publicKey, int verificationFacet, int salt) {
    return bindings.TWBarzGetInitCode(
      Pointer.fromAddress(factory),
      Pointer.fromAddress(publicKey),
      Pointer.fromAddress(verificationFacet),
      salt,
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
  int getDiamondCutCode(int input) {
    return bindings.TWBarzGetDiamondCutCode(
      Pointer.fromAddress(input),
    ).address;
  }
}

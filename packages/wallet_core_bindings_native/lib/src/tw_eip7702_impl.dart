part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWEip7702].
class TWEip7702Impl implements TWEip7702Interface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEip7702Impl(this.bindings);

  @override
  int signAuthorization(
      int chainId, int contractAddress, int nonce, int privateKey) {
    return bindings.TWEip7702SignAuthorization(
      Pointer.fromAddress(chainId),
      Pointer.fromAddress(contractAddress),
      Pointer.fromAddress(nonce),
      Pointer.fromAddress(privateKey),
    ).address;
  }

  @override
  int getAuthorizationHash(int chainId, int contractAddress, int nonce) {
    return bindings.TWEip7702GetAuthorizationHash(
      Pointer.fromAddress(chainId),
      Pointer.fromAddress(contractAddress),
      Pointer.fromAddress(nonce),
    ).address;
  }
}

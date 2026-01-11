part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWEip7702].
class TWEip7702Impl implements TWEip7702Interface {
  final WasmInstance wasm;

  TWEip7702Impl(this.wasm);

  @override
  int signAuthorization(
      int chainId, int contractAddress, int nonce, int privateKey) {
    final func = wasm.getFunction('TWEip7702SignAuthorization')!;
    return func([chainId, contractAddress, nonce, privateKey]).first as int;
  }

  @override
  int getAuthorizationHash(int chainId, int contractAddress, int nonce) {
    final func = wasm.getFunction('TWEip7702GetAuthorizationHash')!;
    return func([chainId, contractAddress, nonce]).first as int;
  }
}

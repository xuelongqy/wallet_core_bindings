part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWAnySigner].
class TWAnySignerImpl extends TWAnySignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWAnySignerImpl(this.bindings);

  @override
  int plan(int input, int coin) {
    return bindings.TWAnySignerPlan(
      Pointer.fromAddress(input),
      coin,
    ).address;
  }

  @override
  int sign(int input, int coin) {
    return bindings.TWAnySignerSign(
      Pointer.fromAddress(input),
      coin,
    ).address;
  }

  @override
  int signJSON(int input, int key, int coin) {
    return bindings.TWAnySignerSignJSON(
      Pointer.fromAddress(input),
      Pointer.fromAddress(key),
      coin,
    ).address;
  }

  @override
  bool supportsJSON(int coin) {
    return bindings.TWAnySignerSupportsJSON(coin);
  }
}

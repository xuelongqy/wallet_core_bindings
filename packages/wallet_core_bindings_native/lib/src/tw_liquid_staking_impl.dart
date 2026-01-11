part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWLiquidStaking].
class TWLiquidStakingImpl extends TWLiquidStakingInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWLiquidStakingImpl(this.bindings);

  @override
  int buildRequest(int input) {
    return bindings.TWLiquidStakingBuildRequest(
      Pointer.fromAddress(input),
    ).address;
  }
}

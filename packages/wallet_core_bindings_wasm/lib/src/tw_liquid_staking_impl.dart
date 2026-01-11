part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWLiquidStaking].
class TWLiquidStakingImpl extends TWLiquidStakingInterface {
  final WasmInstance wasm;

  TWLiquidStakingImpl(this.wasm);

  @override
  int buildRequest(int input) {
    final func = wasm.getFunction('TWLiquidStakingBuildRequest')!;
    return func([input]).first as int;
  }
}

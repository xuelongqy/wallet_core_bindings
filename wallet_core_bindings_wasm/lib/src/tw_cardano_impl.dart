part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWCardano].
class TWCardanoImpl extends TWCardanoInterface {
  final WasmInstance wasm;

  TWCardanoImpl(this.wasm);

  @override
  int getByronAddress(int publicKey) {
    final func = wasm.getFunction('TWCardanoGetByronAddress')!;
    return func([publicKey]).first as int;
  }

  @override
  int getStakingAddress(int baseAddress) {
    final func = wasm.getFunction('TWCardanoGetStakingAddress')!;
    return func([baseAddress]).first as int;
  }

  @override
  int minAdaAmount(int tokenBundle) {
    final func = wasm.getFunction('TWCardanoMinAdaAmount')!;
    return func([tokenBundle]).first as int;
  }

  @override
  int outputMinAdaAmount(int toAddress, int tokenBundle, int coinsPerUtxoByte) {
    final func = wasm.getFunction('TWCardanoOutputMinAdaAmount')!;
    return func([toAddress, tokenBundle, coinsPerUtxoByte]).first as int;
  }
}

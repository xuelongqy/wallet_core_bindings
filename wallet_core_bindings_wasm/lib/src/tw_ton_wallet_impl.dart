part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTONWallet].
class TWTONWalletImpl extends TWTONWalletInterface {
  final WasmInstance wasm;

  TWTONWalletImpl(this.wasm);

  @override
  int buildV4R2StateInit(int publicKey, int workchain, int walletId) {
    final func = wasm.getFunction('TWTONWalletBuildV4R2StateInit')!;
    return func([publicKey, workchain, walletId]).first as int;
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTONWallet].
class TWTONWalletImpl extends TWTONWalletInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTONWalletImpl(this.bindings);

  @override
  int buildV4R2StateInit(int publicKey, int workchain, int walletId) {
    return bindings.TWTONWalletBuildV4R2StateInit(
      Pointer.fromAddress(publicKey),
      workchain,
      walletId,
    ).address;
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWCardano].
class TWCardanoImpl extends TWCardanoInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWCardanoImpl(this.bindings);

  @override
  int getByronAddress(int publicKey) {
    return bindings.TWCardanoGetByronAddress(
      Pointer.fromAddress(publicKey),
    ).address;
  }

  @override
  int getStakingAddress(int baseAddress) {
    return bindings.TWCardanoGetStakingAddress(
      Pointer.fromAddress(baseAddress),
    ).address;
  }

  @override
  int minAdaAmount(int tokenBundle) {
    return bindings.TWCardanoMinAdaAmount(
      Pointer.fromAddress(tokenBundle),
    );
  }

  @override
  int outputMinAdaAmount(int toAddress, int tokenBundle, int coinsPerUtxoByte) {
    return bindings.TWCardanoOutputMinAdaAmount(
      Pointer.fromAddress(toAddress),
      Pointer.fromAddress(tokenBundle),
      Pointer.fromAddress(coinsPerUtxoByte),
    ).address;
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWEthereumRlp].
class TWEthereumRlpImpl extends TWEthereumRlpInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWEthereumRlpImpl(this.bindings);

  @override
  int encode(int coin, int input) {
    return bindings.TWEthereumRlpEncode(
      coin,
      Pointer.fromAddress(input),
    ).address;
  }
}

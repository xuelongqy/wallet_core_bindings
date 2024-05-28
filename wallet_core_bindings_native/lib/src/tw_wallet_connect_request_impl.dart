part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWWalletConnectRequest].
class TWWalletConnectRequestImpl extends TWWalletConnectRequestInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWWalletConnectRequestImpl(this.bindings);

  @override
  int parse(int coin, int input) {
    return bindings.TWWalletConnectRequestParse(
      coin,
      Pointer.fromAddress(input),
    ).address;
  }
}

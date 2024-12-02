part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWMessageSigner].
class TWMessageSignerImpl extends TWMessageSignerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWMessageSignerImpl(this.bindings);

  @override
  int sign(int coin, int input) {
    return bindings.TWMessageSignerSign(
      coin,
      Pointer.fromAddress(input),
    ).address;
  }

  @override
  bool verify(int coin, int input) {
    return bindings.TWMessageSignerVerify(
      coin,
      Pointer.fromAddress(input),
    );
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWDerivationPathIndex].
class TWDerivationPathIndexImpl extends TWDerivationPathIndexInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWDerivationPathIndexImpl(this.bindings);

  @override
  int create(int value, bool hardened) {
    return bindings.TWDerivationPathIndexCreate(
      value,
      hardened,
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWDerivationPathIndexDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWDerivationPathIndexDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool hardened(int pointer) {
    return bindings.TWDerivationPathIndexHardened(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int value(int pointer) {
    return bindings.TWDerivationPathIndexValue(
      Pointer.fromAddress(pointer),
    );
  }
}

part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWAccount].
class TWAccountImpl extends TWAccountInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWAccountImpl(this.bindings);

  @override
  int address(int pointer) {
    return bindings.TWAccountAddress(Pointer.fromAddress(pointer)).address;
  }

  @override
  int coin(int pointer) {
    return bindings.TWAccountCoin(Pointer.fromAddress(pointer));
  }

  @override
  int create(int address, int coin, int derivation, int derivationPath,
      int publicKey, int extendedPublicKey) {
    return bindings.TWAccountCreate(
      Pointer.fromAddress(address),
      coin,
      derivation,
      Pointer.fromAddress(derivationPath),
      Pointer.fromAddress(publicKey),
      Pointer.fromAddress(extendedPublicKey),
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWAccountDelete(Pointer.fromAddress(pointer));
  }

  @override
  int derivation(int pointer) {
    return bindings.TWAccountDerivation(Pointer.fromAddress(pointer));
  }

  @override
  int derivationPath(int pointer) {
    return bindings.TWAccountDerivationPath(Pointer.fromAddress(pointer))
        .address;
  }

  @override
  int extendedPublicKey(int pointer) {
    return bindings.TWAccountExtendedPublicKey(Pointer.fromAddress(pointer))
        .address;
  }

  @override
  int publicKey(int pointer) {
    return bindings.TWAccountPublicKey(Pointer.fromAddress(pointer)).address;
  }
}

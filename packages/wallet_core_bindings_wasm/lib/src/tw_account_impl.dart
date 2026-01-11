part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWAccount].
class TWAccountImpl extends TWAccountInterface {
  final WasmInstance wasm;

  TWAccountImpl(this.wasm);

  @override
  int address(int pointer) {
    final func = wasm.getFunction('TWAccountAddress')!;
    return func([pointer]).first as int;
  }

  @override
  int coin(int pointer) {
    final func = wasm.getFunction('TWAccountCoin')!;
    return func([pointer]).first as int;
  }

  @override
  int create(int address, int coin, int derivation, int derivationPath,
      int publicKey, int extendedPublicKey) {
    final func = wasm.getFunction('TWAccountCreate')!;
    return func([
      address,
      coin,
      derivation,
      derivationPath,
      publicKey,
      extendedPublicKey,
    ]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWAccountDelete')!;
    func([pointer]);
  }

  @override
  int derivation(int pointer) {
    final func = wasm.getFunction('TWAccountDerivation')!;
    return func([pointer]).first as int;
  }

  @override
  int derivationPath(int pointer) {
    final func = wasm.getFunction('TWAccountDerivationPath')!;
    return func([pointer]).first as int;
  }

  @override
  int extendedPublicKey(int pointer) {
    final func = wasm.getFunction('TWAccountExtendedPublicKey')!;
    return func([pointer]).first as int;
  }

  @override
  int publicKey(int pointer) {
    final func = wasm.getFunction('TWAccountPublicKey')!;
    return func([pointer]).first as int;
  }
}

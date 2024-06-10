part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWHDWallet].
class TWHDWalletImpl extends TWHDWalletInterface {
  final WasmInstance wasm;

  TWHDWalletImpl(this.wasm);

  @override
  int create(int strength, int passphrase) {
    final func = wasm.getFunction('TWHDWalletCreate')!;
    return func([strength, passphrase]).first as int;
  }

  @override
  int createWithEntropy(int entropy, int passphrase) {
    final func = wasm.getFunction('TWHDWalletCreateWithEntropy')!;
    return func([entropy, passphrase]).first as int;
  }

  @override
  int createWithMnemonic(int mnemonic, int passphrase) {
    final func = wasm.getFunction('TWHDWalletCreateWithMnemonic')!;
    return func([mnemonic, passphrase]).first as int;
  }

  @override
  int createWithMnemonicCheck(int mnemonic, int passphrase, bool check) {
    final func = wasm.getFunction('TWHDWalletCreateWithMnemonicCheck')!;
    return func([mnemonic, passphrase, check ? 1 : 0]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWHDWalletDelete')!;
    func([pointer]);
  }

  @override
  int entropy(int pointer) {
    final func = wasm.getFunction('TWHDWalletEntropy')!;
    return func([pointer]).first as int;
  }

  @override
  int getAddressDerivation(int pointer, int coin, int derivation) {
    final func = wasm.getFunction('TWHDWalletGetAddressDerivation')!;
    return func([pointer, coin, derivation]).first as int;
  }

  @override
  int getAddressForCoin(int pointer, int coin) {
    final func = wasm.getFunction('TWHDWalletGetAddressForCoin')!;
    return func([pointer, coin]).first as int;
  }

  @override
  int getDerivedKey(
      int pointer, int coin, int account, int change, int address) {
    final func = wasm.getFunction('TWHDWalletGetDerivedKey')!;
    return func([pointer, coin, account, change, address]).first as int;
  }

  @override
  int getExtendedPrivateKey(int pointer, int purpose, int coin, int version) {
    final func = wasm.getFunction('TWHDWalletGetExtendedPrivateKey')!;
    return func([pointer, purpose, coin, version]).first as int;
  }

  @override
  int getExtendedPrivateKeyAccount(int pointer, int purpose, int coin,
      int derivation, int version, int account) {
    final func = wasm.getFunction('TWHDWalletGetExtendedPrivateKeyAccount')!;
    return func([pointer, purpose, coin, derivation, version, account]).first
        as int;
  }

  @override
  int getExtendedPrivateKeyDerivation(
      int pointer, int purpose, int coin, int derivation, int version) {
    final func = wasm.getFunction('TWHDWalletGetExtendedPrivateKeyDerivation')!;
    return func([pointer, purpose, coin, derivation, version]).first as int;
  }

  @override
  int getExtendedPublicKey(int pointer, int purpose, int coin, int version) {
    final func = wasm.getFunction('TWHDWalletGetExtendedPublicKey')!;
    return func([pointer, purpose, coin, version]).first as int;
  }

  @override
  int getExtendedPublicKeyAccount(int pointer, int purpose, int coin,
      int derivation, int version, int account) {
    final func = wasm.getFunction('TWHDWalletGetExtendedPublicKeyAccount')!;
    return func([pointer, purpose, coin, derivation, version, account]).first
        as int;
  }

  @override
  int getExtendedPublicKeyDerivation(
      int pointer, int purpose, int coin, int derivation, int version) {
    final func = wasm.getFunction('TWHDWalletGetExtendedPublicKeyDerivation')!;
    return func([pointer, purpose, coin, derivation, version]).first as int;
  }

  @override
  int getKey(int pointer, int coin, int derivationPath) {
    final func = wasm.getFunction('TWHDWalletGetKey')!;
    return func([pointer, coin, derivationPath]).first as int;
  }

  @override
  int getKeyByCurve(int pointer, int curve, int derivationPath) {
    final func = wasm.getFunction('TWHDWalletGetKeyByCurve')!;
    return func([pointer, curve, derivationPath]).first as int;
  }

  @override
  int getKeyDerivation(int pointer, int coin, int derivation) {
    final func = wasm.getFunction('TWHDWalletGetKeyDerivation')!;
    return func([pointer, coin, derivation]).first as int;
  }

  @override
  int getKeyForCoin(int pointer, int coin) {
    final func = wasm.getFunction('TWHDWalletGetKeyForCoin')!;
    return func([pointer, coin]).first as int;
  }

  @override
  int getMasterKey(int pointer, int curve) {
    final func = wasm.getFunction('TWHDWalletGetMasterKey')!;
    return func([pointer, curve]).first as int;
  }

  @override
  int getPublicKeyFromExtended(int extended, int coin, int derivationPath) {
    final func = wasm.getFunction('TWHDWalletGetPublicKeyFromExtended')!;
    return func([extended, coin, derivationPath]).first as int;
  }

  @override
  int mnemonic(int pointer) {
    final func = wasm.getFunction('TWHDWalletMnemonic')!;
    return func([pointer]).first as int;
  }

  @override
  int seed(int pointer) {
    final func = wasm.getFunction('TWHDWalletSeed')!;
    return func([pointer]).first as int;
  }
}

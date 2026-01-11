part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWHDWallet].
class TWHDWalletImpl extends TWHDWalletInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWHDWalletImpl(this.bindings);

  @override
  int create(int strength, int passphrase) {
    return bindings.TWHDWalletCreate(
      strength,
      Pointer.fromAddress(passphrase),
    ).address;
  }

  @override
  int createWithEntropy(int entropy, int passphrase) {
    return bindings.TWHDWalletCreateWithEntropy(
      Pointer.fromAddress(entropy),
      Pointer.fromAddress(passphrase),
    ).address;
  }

  @override
  int createWithMnemonic(int mnemonic, int passphrase) {
    return bindings.TWHDWalletCreateWithMnemonic(
      Pointer.fromAddress(mnemonic),
      Pointer.fromAddress(passphrase),
    ).address;
  }

  @override
  int createWithMnemonicCheck(int mnemonic, int passphrase, bool check) {
    return bindings.TWHDWalletCreateWithMnemonicCheck(
      Pointer.fromAddress(mnemonic),
      Pointer.fromAddress(passphrase),
      check,
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWHDWalletDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int entropy(int pointer) {
    return bindings.TWHDWalletEntropy(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int getAddressDerivation(int pointer, int coin, int derivation) {
    return bindings.TWHDWalletGetAddressDerivation(
      Pointer.fromAddress(pointer),
      coin,
      derivation,
    ).address;
  }

  @override
  int getAddressForCoin(int pointer, int coin) {
    return bindings.TWHDWalletGetAddressForCoin(
      Pointer.fromAddress(pointer),
      coin,
    ).address;
  }

  @override
  int getDerivedKey(
      int pointer, int coin, int account, int change, int address) {
    return bindings.TWHDWalletGetDerivedKey(
      Pointer.fromAddress(pointer),
      coin,
      account,
      change,
      address,
    ).address;
  }

  @override
  int getExtendedPrivateKey(int pointer, int purpose, int coin, int version) {
    return bindings.TWHDWalletGetExtendedPrivateKey(
      Pointer.fromAddress(pointer),
      purpose,
      coin,
      version,
    ).address;
  }

  @override
  int getExtendedPrivateKeyAccount(int pointer, int purpose, int coin,
      int derivation, int version, int account) {
    return bindings.TWHDWalletGetExtendedPrivateKeyAccount(
      Pointer.fromAddress(pointer),
      purpose,
      coin,
      derivation,
      version,
      account,
    ).address;
  }

  @override
  int getExtendedPrivateKeyDerivation(
      int pointer, int purpose, int coin, int derivation, int version) {
    return bindings.TWHDWalletGetExtendedPrivateKeyDerivation(
      Pointer.fromAddress(pointer),
      purpose,
      coin,
      derivation,
      version,
    ).address;
  }

  @override
  int getExtendedPublicKey(int pointer, int purpose, int coin, int version) {
    return bindings.TWHDWalletGetExtendedPublicKey(
      Pointer.fromAddress(pointer),
      purpose,
      coin,
      version,
    ).address;
  }

  @override
  int getExtendedPublicKeyAccount(int pointer, int purpose, int coin,
      int derivation, int version, int account) {
    return bindings.TWHDWalletGetExtendedPublicKeyAccount(
      Pointer.fromAddress(pointer),
      purpose,
      coin,
      derivation,
      version,
      account,
    ).address;
  }

  @override
  int getExtendedPublicKeyDerivation(
      int pointer, int purpose, int coin, int derivation, int version) {
    return bindings.TWHDWalletGetExtendedPublicKeyDerivation(
      Pointer.fromAddress(pointer),
      purpose,
      coin,
      derivation,
      version,
    ).address;
  }

  @override
  int getKey(int pointer, int coin, int derivationPath) {
    return bindings.TWHDWalletGetKey(
      Pointer.fromAddress(pointer),
      coin,
      Pointer.fromAddress(derivationPath),
    ).address;
  }

  @override
  int getKeyByCurve(int pointer, int curve, int derivationPath) {
    return bindings.TWHDWalletGetKeyByCurve(
      Pointer.fromAddress(pointer),
      curve,
      Pointer.fromAddress(derivationPath),
    ).address;
  }

  @override
  int getKeyDerivation(int pointer, int coin, int derivation) {
    return bindings.TWHDWalletGetKeyDerivation(
      Pointer.fromAddress(pointer),
      coin,
      derivation,
    ).address;
  }

  @override
  int getKeyForCoin(int pointer, int coin) {
    return bindings.TWHDWalletGetKeyForCoin(
      Pointer.fromAddress(pointer),
      coin,
    ).address;
  }

  @override
  int getMasterKey(int pointer, int curve) {
    return bindings.TWHDWalletGetMasterKey(
      Pointer.fromAddress(pointer),
      curve,
    ).address;
  }

  @override
  int getPublicKeyFromExtended(int extended, int coin, int derivationPath) {
    return bindings.TWHDWalletGetPublicKeyFromExtended(
      Pointer.fromAddress(extended),
      coin,
      Pointer.fromAddress(derivationPath),
    ).address;
  }

  @override
  int mnemonic(int pointer) {
    return bindings.TWHDWalletMnemonic(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int seed(int pointer) {
    return bindings.TWHDWalletSeed(
      Pointer.fromAddress(pointer),
    ).address;
  }
}

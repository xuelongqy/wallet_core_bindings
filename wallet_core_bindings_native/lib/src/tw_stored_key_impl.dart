part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWStoredKey].
class TWStoredKeyImpl extends TWStoredKeyInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWStoredKeyImpl(this.bindings);

  @override
  int account(int pointer, int index) {
    return bindings.TWStoredKeyAccount(
      Pointer.fromAddress(pointer),
      index,
    ).address;
  }

  @override
  int accountCount(int pointer) {
    return bindings.TWStoredKeyAccountCount(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int accountForCoin(int pointer, int coin, int wallet) {
    return bindings.TWStoredKeyAccountForCoin(
      Pointer.fromAddress(pointer),
      coin,
      Pointer.fromAddress(wallet),
    ).address;
  }

  @override
  int accountForCoinDerivation(
      int pointer, int coin, int derivation, int wallet) {
    return bindings.TWStoredKeyAccountForCoinDerivation(
      Pointer.fromAddress(pointer),
      coin,
      derivation,
      Pointer.fromAddress(wallet),
    ).address;
  }

  @override
  void addAccount(int pointer, int address, int coin, int derivationPath,
      int publicKey, int extendedPublicKey) {
    return bindings.TWStoredKeyAddAccount(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(address),
      coin,
      Pointer.fromAddress(derivationPath),
      Pointer.fromAddress(publicKey),
      Pointer.fromAddress(extendedPublicKey),
    );
  }

  @override
  void addAccountDerivation(int pointer, int address, int coin, int derivation,
      int derivationPath, int publicKey, int extendedPublicKey) {
    return bindings.TWStoredKeyAddAccountDerivation(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(address),
      coin,
      derivation,
      Pointer.fromAddress(derivationPath),
      Pointer.fromAddress(publicKey),
      Pointer.fromAddress(extendedPublicKey),
    );
  }

  @override
  int create(int name, int password) {
    return bindings.TWStoredKeyCreate(
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
    ).address;
  }

  @override
  int createEncryption(int name, int password, int encryption) {
    return bindings.TWStoredKeyCreateEncryption(
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      encryption,
    ).address;
  }

  @override
  int createLevel(int name, int password, int encryptionLevel) {
    return bindings.TWStoredKeyCreateLevel(
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      encryptionLevel,
    ).address;
  }

  @override
  int createLevelAndEncryption(
      int name, int password, int encryptionLevel, int encryption) {
    return bindings.TWStoredKeyCreateLevelAndEncryption(
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      encryptionLevel,
      encryption,
    ).address;
  }

  @override
  int decryptMnemonic(int pointer, int password) {
    return bindings.TWStoredKeyDecryptMnemonic(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(password),
    ).address;
  }

  @override
  int decryptPrivateKey(int pointer, int password) {
    return bindings.TWStoredKeyDecryptPrivateKey(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(password),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWStoredKeyDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int encryptionParameters(int pointer) {
    return bindings.TWStoredKeyEncryptionParameters(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int exportJSON(int pointer) {
    return bindings.TWStoredKeyExportJSON(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool fixAddresses(int pointer, int password) {
    return bindings.TWStoredKeyFixAddresses(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(password),
    );
  }

  @override
  int identifier(int pointer) {
    return bindings.TWStoredKeyIdentifier(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int importHDWallet(int mnemonic, int name, int password, int coin) {
    return bindings.TWStoredKeyImportHDWallet(
      Pointer.fromAddress(mnemonic),
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      coin,
    ).address;
  }

  @override
  int importHDWalletWithEncryption(
      int mnemonic, int name, int password, int coin, int encryption) {
    return bindings.TWStoredKeyImportHDWalletWithEncryption(
      Pointer.fromAddress(mnemonic),
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      coin,
      encryption,
    ).address;
  }

  @override
  int importJSON(int json) {
    return bindings.TWStoredKeyImportJSON(
      Pointer.fromAddress(json),
    ).address;
  }

  @override
  int importPrivateKey(int privateKey, int name, int password, int coin) {
    return bindings.TWStoredKeyImportPrivateKey(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      coin,
    ).address;
  }

  @override
  int importPrivateKeyWithEncryption(
      int privateKey, int name, int password, int coin, int encryption) {
    return bindings.TWStoredKeyImportPrivateKeyWithEncryption(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      coin,
      encryption,
    ).address;
  }

  @override
  bool isMnemonic(int pointer) {
    return bindings.TWStoredKeyIsMnemonic(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int load(int path) {
    return bindings.TWStoredKeyLoad(
      Pointer.fromAddress(path),
    ).address;
  }

  @override
  int name(int pointer) {
    return bindings.TWStoredKeyName(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int privateKey(int pointer, int coin, int password) {
    return bindings.TWStoredKeyPrivateKey(
      Pointer.fromAddress(pointer),
      coin,
      Pointer.fromAddress(password),
    ).address;
  }

  @override
  void removeAccountForCoin(int pointer, int coin) {
    return bindings.TWStoredKeyRemoveAccountForCoin(
      Pointer.fromAddress(pointer),
      coin,
    );
  }

  @override
  void removeAccountForCoinDerivation(int pointer, int coin, int derivation) {
    return bindings.TWStoredKeyRemoveAccountForCoinDerivation(
      Pointer.fromAddress(pointer),
      coin,
      derivation,
    );
  }

  @override
  void removeAccountForCoinDerivationPath(
      int pointer, int coin, int derivationPath) {
    return bindings.TWStoredKeyRemoveAccountForCoinDerivationPath(
      Pointer.fromAddress(pointer),
      coin,
      Pointer.fromAddress(derivationPath),
    );
  }

  @override
  bool store(int pointer, int path) {
    return bindings.TWStoredKeyStore(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(path),
    );
  }

  @override
  int wallet(int pointer, int password) {
    return bindings.TWStoredKeyWallet(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(password),
    ).address;
  }

  @override
  bool updateAddress(int pointer, int coin) {
    return bindings.TWStoredKeyUpdateAddress(
      Pointer.fromAddress(pointer),
      coin,
    );
  }

  @override
  int decryptPrivateKeyEncoded(int key, int password) {
    return bindings.TWStoredKeyDecryptPrivateKeyEncoded(
      Pointer.fromAddress(key),
      Pointer.fromAddress(password),
    ).address;
  }

  @override
  bool hasPrivateKeyEncoded(int key) {
    return bindings.TWStoredKeyHasPrivateKeyEncoded(
      Pointer.fromAddress(key),
    );
  }

  @override
  int importPrivateKeyEncoded(
      int privateKey, int name, int password, int coin) {
    return bindings.TWStoredKeyImportPrivateKeyEncoded(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      coin,
    ).address;
  }

  @override
  int importPrivateKeyEncodedWithEncryption(
      int privateKey, int name, int password, int coin, int encryption) {
    return bindings.TWStoredKeyImportPrivateKeyEncodedWithEncryption(
      Pointer.fromAddress(privateKey),
      Pointer.fromAddress(name),
      Pointer.fromAddress(password),
      coin,
      encryption,
    ).address;
  }
}

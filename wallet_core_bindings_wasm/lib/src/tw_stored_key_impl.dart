part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWStoredKey].
class TWStoredKeyImpl extends TWStoredKeyInterface {
  final WasmInstance wasm;

  TWStoredKeyImpl(this.wasm);

  @override
  int account(int pointer, int index) {
    final func = wasm.getFunction('TWStoredKeyAccount')!;
    return func([pointer, index]).first as int;
  }

  @override
  int accountCount(int pointer) {
    final func = wasm.getFunction('TWStoredKeyAccountCount')!;
    return func([pointer]).first as int;
  }

  @override
  int accountForCoin(int pointer, int coin, int wallet) {
    final func = wasm.getFunction('TWStoredKeyAccountForCoin')!;
    return func([pointer, coin, wallet]).first as int;
  }

  @override
  int accountForCoinDerivation(
      int pointer, int coin, int derivation, int wallet) {
    final func = wasm.getFunction('TWStoredKeyAccountForCoinDerivation')!;
    return func([pointer, coin, derivation, wallet]).first as int;
  }

  @override
  void addAccount(int pointer, int address, int coin, int derivationPath,
      int publicKey, int extendedPublicKey) {
    final func = wasm.getFunction('TWStoredKeyAddAccount')!;
    func(
        [pointer, address, coin, derivationPath, publicKey, extendedPublicKey]);
  }

  @override
  void addAccountDerivation(int pointer, int address, int coin, int derivation,
      int derivationPath, int publicKey, int extendedPublicKey) {
    final func = wasm.getFunction('TWStoredKeyAddAccountDerivation')!;
    func([
      pointer,
      address,
      coin,
      derivation,
      derivationPath,
      publicKey,
      extendedPublicKey
    ]);
  }

  @override
  int create(int name, int password) {
    final func = wasm.getFunction('TWStoredKeyCreate')!;
    return func([name, password]).first as int;
  }

  @override
  int createEncryption(int name, int password, int encryption) {
    final func = wasm.getFunction('TWStoredKeyCreateEncryption')!;
    return func([name, password, encryption]).first as int;
  }

  @override
  int createLevel(int name, int password, int encryptionLevel) {
    final func = wasm.getFunction('TWStoredKeyCreateLevel')!;
    return func([name, password, encryptionLevel]).first as int;
  }

  @override
  int createLevelAndEncryption(
      int name, int password, int encryptionLevel, int encryption) {
    final func = wasm.getFunction('TWStoredKeyCreateLevelAndEncryption')!;
    return func([name, password, encryptionLevel, encryption]).first as int;
  }

  @override
  int decryptMnemonic(int pointer, int password) {
    final func = wasm.getFunction('TWStoredKeyDecryptMnemonic')!;
    return func([pointer, password]).first as int;
  }

  @override
  int decryptPrivateKey(int pointer, int password) {
    final func = wasm.getFunction('TWStoredKeyDecryptPrivateKey')!;
    return func([pointer, password]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWStoredKeyDelete')!;
    func([pointer]);
  }

  @override
  int encryptionParameters(int pointer) {
    final func = wasm.getFunction('TWStoredKeyEncryptionParameters')!;
    return func([pointer]).first as int;
  }

  @override
  int exportJSON(int pointer) {
    final func = wasm.getFunction('TWStoredKeyExportJSON')!;
    return func([pointer]).first as int;
  }

  @override
  bool fixAddresses(int pointer, int password) {
    final func = wasm.getFunction('TWStoredKeyFixAddresses')!;
    return func([pointer, password]).first as int != 0;
  }

  @override
  int identifier(int pointer) {
    final func = wasm.getFunction('TWStoredKeyIdentifier')!;
    return func([pointer]).first as int;
  }

  @override
  int importHDWallet(int mnemonic, int name, int password, int coin) {
    final func = wasm.getFunction('TWStoredKeyImportHDWallet')!;
    return func([mnemonic, name, password, coin]).first as int;
  }

  @override
  int importHDWalletWithEncryption(
      int mnemonic, int name, int password, int coin, int encryption) {
    final func = wasm.getFunction('TWStoredKeyImportHDWalletWithEncryption')!;
    return func([mnemonic, name, password, coin, encryption]).first as int;
  }

  @override
  int importJSON(int json) {
    final func = wasm.getFunction('TWStoredKeyImportJSON')!;
    return func([json]).first as int;
  }

  @override
  int importPrivateKey(int privateKey, int name, int password, int coin) {
    final func = wasm.getFunction('TWStoredKeyImportPrivateKey')!;
    return func([privateKey, name, password, coin]).first as int;
  }

  @override
  int importPrivateKeyWithEncryption(
      int privateKey, int name, int password, int coin, int encryption) {
    final func = wasm.getFunction('TWStoredKeyImportPrivateKeyWithEncryption')!;
    return func([privateKey, name, password, coin, encryption]).first as int;
  }

  @override
  bool isMnemonic(int pointer) {
    final func = wasm.getFunction('TWStoredKeyIsMnemonic')!;
    return func([pointer]).first as int != 0;
  }

  @override
  int load(int path) {
    final file = File(TWString.fromPointer(path, attach: false).value!);
    if (!file.existsSync()) {
      return 0;
    }
    return importJSON(TWString(file.readAsStringSync()).pointer);
    // final func = wasm.getFunction('TWStoredKeyLoad')!;
    // return func([path]).first as int;
  }

  @override
  int name(int pointer) {
    final func = wasm.getFunction('TWStoredKeyName')!;
    return func([pointer]).first as int;
  }

  @override
  int privateKey(int pointer, int coin, int password) {
    final func = wasm.getFunction('TWStoredKeyPrivateKey')!;
    return func([pointer, coin, password]).first as int;
  }

  @override
  void removeAccountForCoin(int pointer, int coin) {
    final func = wasm.getFunction('TWStoredKeyRemoveAccountForCoin')!;
    func([pointer, coin]);
  }

  @override
  void removeAccountForCoinDerivation(int pointer, int coin, int derivation) {
    final func = wasm.getFunction('TWStoredKeyRemoveAccountForCoinDerivation')!;
    func([pointer, coin, derivation]);
  }

  @override
  void removeAccountForCoinDerivationPath(
      int pointer, int coin, int derivationPath) {
    final func =
        wasm.getFunction('TWStoredKeyRemoveAccountForCoinDerivationPath')!;
    func([pointer, coin, derivationPath]);
  }

  @override
  bool store(int pointer, int path) {
    final json = exportJSON(pointer);
    final filePath = TWString.fromPointer(path).value!;
    try {
      File(filePath).writeAsStringSync(TWString.fromPointer(json).value!);
      return true;
    } catch (_, s) {
      debugPrintStack(stackTrace: s);
      return false;
    }
    // final func = wasm.getFunction('TWStoredKeyStore')!;
    // return func([pointer, path]).first as int != 0;
  }

  @override
  int wallet(int pointer, int password) {
    final func = wasm.getFunction('TWStoredKeyWallet')!;
    return func([pointer, password]).first as int;
  }

  @override
  bool updateAddress(int pointer, int coin) {
    final func = wasm.getFunction('TWStoredKeyUpdateAddress')!;
    return func([pointer, coin]).first as int != 0;
  }
}

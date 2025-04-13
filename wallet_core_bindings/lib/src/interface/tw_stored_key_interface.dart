part of '../../wallet_core_bindings.dart';

/// [TWStoredKey] interface.
abstract class TWStoredKeyInterface {
  int load(int path);

  int importPrivateKey(int privateKey, int name, int password, int coin);

  int importPrivateKeyWithEncryption(
      int privateKey, int name, int password, int coin, int encryption);

  int importPrivateKeyEncoded(int privateKey, int name, int password, int coin);

  int importPrivateKeyEncodedWithEncryption(
      int privateKey, int name, int password, int coin, int encryption);

  int importHDWallet(int mnemonic, int name, int password, int coin);

  int importHDWalletWithEncryption(
      int mnemonic, int name, int password, int coin, int encryption);

  int importJSON(int json);

  int createLevel(int name, int password, int encryptionLevel);

  int createLevelAndEncryption(
      int name, int password, int encryptionLevel, int encryption);

  int create(int name, int password);

  int createEncryption(int name, int password, int encryption);

  int identifier(int pointer);

  int name(int pointer);

  bool isMnemonic(int pointer);

  int accountCount(int pointer);

  int account(int pointer, int index);

  int accountForCoin(int pointer, int coin, int wallet);

  int accountForCoinDerivation(
      int pointer, int coin, int derivation, int wallet);

  void addAccountDerivation(int pointer, int address, int coin, int derivation,
      int derivationPath, int publicKey, int extendedPublicKey);

  void addAccount(int pointer, int address, int coin, int derivationPath,
      int publicKey, int extendedPublicKey);

  void removeAccountForCoin(int pointer, int coin);

  void removeAccountForCoinDerivation(int pointer, int coin, int derivation);

  void removeAccountForCoinDerivationPath(
      int pointer, int coin, int derivationPath);

  bool store(int pointer, int path);

  int decryptPrivateKey(int pointer, int password);

  int decryptPrivateKeyEncoded(int key, int password);

  bool hasPrivateKeyEncoded(int key);

  int decryptMnemonic(int pointer, int password);

  int privateKey(int pointer, int coin, int password);

  int wallet(int pointer, int password);

  int exportJSON(int pointer);

  bool fixAddresses(int pointer, int password);

  bool updateAddress(int pointer, int coin);

  int encryptionParameters(int pointer);

  void delete(int pointer);
}

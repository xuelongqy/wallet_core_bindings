part of '../../wallet_core_bindings.dart';

/// [TWHDWallet] interface.
abstract class TWHDWalletInterface {
  int create(int strength, int passphrase);

  int createWithMnemonic(int mnemonic, int passphrase);

  int createWithMnemonicCheck(int mnemonic, int passphrase, bool check);

  int createWithEntropy(int entropy, int passphrase);

  int seed(int pointer);

  int mnemonic(int pointer);

  int entropy(int pointer);

  int getMasterKey(int pointer, int curve);

  int getKeyForCoin(int pointer, int coin);

  int getAddressForCoin(int pointer, int coin);

  int getAddressDerivation(int pointer, int coin, int derivation);

  int getKey(int pointer, int coin, int derivationPath);

  int getKeyDerivation(int pointer, int coin, int derivation);

  int getKeyByCurve(int pointer, int curve, int derivationPath);

  int getDerivedKey(
      int pointer, int coin, int account, int change, int address);

  int getExtendedPrivateKey(int pointer, int purpose, int coin, int version);

  int getExtendedPublicKey(int pointer, int purpose, int coin, int version);

  int getExtendedPrivateKeyAccount(int pointer, int purpose, int coin,
      int derivation, int version, int account);

  int getExtendedPublicKeyAccount(int pointer, int purpose, int coin,
      int derivation, int version, int account);

  int getExtendedPrivateKeyDerivation(
      int pointer, int purpose, int coin, int derivation, int version);

  int getExtendedPublicKeyDerivation(
      int pointer, int purpose, int coin, int derivation, int version);

  int getPublicKeyFromExtended(int extended, int coin, int derivationPath);

  void delete(int pointer);
}

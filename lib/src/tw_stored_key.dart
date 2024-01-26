part of '../wallet_core_bindings.dart';

/// TWStoredKey finalizer.
final _twStoredKeyFinalizer = Finalizer<Pointer<bindings.TWStoredKey>>(
    (Pointer<bindings.TWStoredKey> token) {
  iTWBindings.TWStoredKeyDelete(token);
});

/// Represents a key stored as an encrypted file.
class TWStoredKey extends TWObjectFinalizable<bindings.TWStoredKey> {
  TWStoredKey.fromPointer(
    Pointer<bindings.TWStoredKey> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Loads a key from a file.
  ///
  /// \param [path] filepath to the key as a non-null string
  TWStoredKey.load(
    String path, {
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyLoad(TWString(path).pointer),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports a private key.
  ///
  /// \param [privateKey] Non-null Block of data private key
  /// \param [name] The name of the stored key to import as a non-null string
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [coin] the coin type
  TWStoredKey.importPrivateKey({
    required Uint8List privateKey,
    required String name,
    required Uint8List password,
    required int coin,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyImportPrivateKey(
            TWData(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports a private key.
  ///
  /// \param [privateKey] Non-null Block of data private key
  /// \param [name] The name of the stored key to import as a non-null string
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [coin] the coin type
  /// \param [encryption] cipher encryption mode
  TWStoredKey.importPrivateKeyWithEncryption({
    required Uint8List privateKey,
    required String name,
    required Uint8List password,
    required int coin,
    required int encryption,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyImportPrivateKeyWithEncryption(
            TWData(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin,
            encryption,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports an HD wallet.
  ///
  /// \param [mnemonic] Non-null bip39 mnemonic
  /// \param [name] The name of the stored key to import as a non-null string
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [coin] the coin type
  TWStoredKey.importHDWallet({
    required String mnemonic,
    required String name,
    required Uint8List password,
    required int coin,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyImportHDWallet(
            TWString(mnemonic).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports an HD wallet.
  ///
  /// \param [mnemonic] Non-null bip39 mnemonic
  /// \param [name] The name of the stored key to import as a non-null string
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [coin] the coin type
  /// \param [encryption] cipher encryption mode
  TWStoredKey.importHDWalletWithEncryption({
    required String mnemonic,
    required String name,
    required Uint8List password,
    required int coin,
    required int encryption,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyImportHDWalletWithEncryption(
            TWString(mnemonic).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin,
            encryption,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports a key from JSON.
  ///
  /// \param [json] Json stored key import format as a non-null block of data
  TWStoredKey.importJSON(
    Uint8List json, {
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyImportJSON(TWData(json).pointer),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Creates a new key, with given encryption strength level. Returned object needs to be deleted.
  ///
  /// \param [name] The name of the key to be stored
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [encryptionLevel] The level of encryption, see \TWStoredKeyEncryptionLevel
  /// TW_DEPRECATED_FOR("3.1.1", "[TWStoredKey.createLevelAndEncryption]")
  @deprecated
  TWStoredKey.createLevel({
    required String name,
    required Uint8List password,
    required int encryptionLevel,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyCreateLevel(
            TWString(name).pointer,
            TWData(password).pointer,
            encryptionLevel,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Creates a new key, with given encryption strength level.  Returned object needs to be deleted.
  ///
  /// \param [name] The name of the key to be stored
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [encryptionLevel] The level of encryption, see \TWStoredKeyEncryptionLevel
  /// \param [encryption] cipher encryption mode
  TWStoredKey.createLevelAndEncryption({
    required String name,
    required Uint8List password,
    required int encryptionLevel,
    required int encryption,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyCreateLevelAndEncryption(
            TWString(name).pointer,
            TWData(password).pointer,
            encryptionLevel,
            encryption,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Creates a new key.
  ///
  /// \deprecated use [TWStoredKey.createLevel].
  /// \param [name] The name of the key to be stored
  /// \param [password] Non-null block of data, password of the stored key
  @deprecated
  TWStoredKey({
    required String name,
    required Uint8List password,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyCreate(
            TWString(name).pointer,
            TWData(password).pointer,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Creates a new key.
  ///
  /// \deprecated use [TWStoredKey.createLevel].
  /// \param name The name of the key to be stored
  /// \param password Non-null block of data, password of the stored key
  /// \param encryption cipher encryption mode
  /// \note Returned object needs to be deleted with \TWStoredKeyDelete
  /// \return The stored key as a non-null pointer
  @deprecated
  TWStoredKey.createEncryption({
    required String name,
    required Uint8List password,
    required int encryption,
    bool attach = true,
  }) : super(
          iTWBindings.TWStoredKeyCreateEncryption(
            TWString(name).pointer,
            TWData(password).pointer,
            encryption,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Delete a stored key
  @override
  void delete() {
    super.delete();
    iTWBindings.TWStoredKeyDelete(pointer);
  }

  /// Stored key unique identifier.
  String get identifier =>
      TWString.fromPointer(iTWBindings.TWStoredKeyIdentifier(_pointer))
          .toString();

  /// Stored key namer.
  String get name =>
      TWString.fromPointer(iTWBindings.TWStoredKeyName(_pointer)).toString();

  /// Whether this key is a mnemonic phrase for a HD wallet.
  bool get isMnemonic => iTWBindings.TWStoredKeyIsMnemonic(_pointer);

  /// The number of accounts.
  int get accountCount => iTWBindings.TWStoredKeyAccountCount(_pointer);

  /// Returns the account at a given index.
  ///
  /// \param [index] the account index to be retrieved
  /// \return Null pointer if the associated account is not found, pointer to the account otherwise.
  TWAccount account(int index) => TWAccount.fromPointer(
        iTWBindings.TWStoredKeyAccount(_pointer, index),
      );

  /// Returns the account for a specific coin, creating it if necessary.
  ///
  /// \param [coin] The coin type
  /// \param [wallet] The associated HD wallet, can be null.
  /// \return Null pointer if the associated account is not found/not created, pointer to the account otherwise.
  TWAccount accountForCoin(int coin, TWHDWallet wallet) =>
      TWAccount.fromPointer(iTWBindings.TWStoredKeyAccountForCoin(
          _pointer, coin, wallet.pointer));

  /// Returns the account for a specific coin + derivation, creating it if necessary.
  ///
  /// \param [coin] The coin type
  /// \param [derivation] The derivation for the given coin
  /// \param [wallet] the associated HD wallet, can be null.
  /// \return Null pointer if the associated account is not found/not created, pointer to the account otherwise.
  TWAccount accountForCoinDerivation({
    required int coin,
    required int derivation,
    required TWHDWallet wallet,
  }) =>
      TWAccount.fromPointer(iTWBindings.TWStoredKeyAccountForCoinDerivation(
        _pointer,
        coin,
        derivation,
        wallet.pointer,
      ));

  /// Adds a new account, using given derivation (usually TWDerivationDefault)
  /// and derivation path (usually matches path from derivation, but custom possible).
  ///
  /// \param [address] Non-null pointer to the address of the coin for this account
  /// \param [coin] coin type
  /// \param [derivation] derivation of the given coin type
  /// \param [derivationPath] HD bip44 derivation path of the given coin
  /// \param [publicKey] Non-null public key of the given coin/address
  /// \param [extendedPublicKey] Non-null extended public key of the given coin/address
  void addAccountDerivation({
    required String address,
    required int coin,
    required int derivation,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
  }) =>
      iTWBindings.TWStoredKeyAddAccountDerivation(
        _pointer,
        TWString(address).pointer,
        coin,
        derivation,
        TWString(derivationPath).pointer,
        TWString(publicKey).pointer,
        TWString(extendedPublicKey).pointer,
      );

  /// Adds a new account, using given derivation path.
  ///
  /// \deprecated Use [TWStoredKey.addAccountDerivation] (with TWDerivationDefault) instead.
  /// \param [address] Non-null pointer to the address of the coin for this account
  /// \param [coin] coin type
  /// \param [derivationPath] HD bip44 derivation path of the given coin
  /// \param [publicKey] Non-null public key of the given coin/address
  /// \param [extendedPublicKey] Non-null extended public key of the given coin/address
  @deprecated
  void addAccount({
    required String address,
    required int coin,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
  }) =>
      iTWBindings.TWStoredKeyAddAccount(
        _pointer,
        TWString(address).pointer,
        coin,
        TWString(derivationPath).pointer,
        TWString(publicKey).pointer,
        TWString(extendedPublicKey).pointer,
      );

  /// Remove the account for a specific coin
  ///
  /// \param [coin] Account coin type to be removed
  void removeAccountForCoin(int coin) =>
      iTWBindings.TWStoredKeyRemoveAccountForCoin(
        _pointer,
        coin,
      );

  /// Remove the account for a specific coin with the given derivation.
  ///
  /// \param [coin] Account coin type to be removed
  /// \param [derivation] The derivation of the given coin type
  void removeAccountForCoinDerivation(int coin, int derivation) =>
      iTWBindings.TWStoredKeyRemoveAccountForCoinDerivation(
        _pointer,
        coin,
        derivation,
      );

  /// Remove the account for a specific coin with the given derivation path.
  ///
  /// \param [coin] Account coin type to be removed
  /// \param [derivationPath] The derivation path (bip44) of the given coin type
  void removeAccountForCoinDerivationPath(int coin, String derivationPath) =>
      iTWBindings.TWStoredKeyRemoveAccountForCoinDerivationPath(
        _pointer,
        coin,
        TWString(derivationPath).pointer,
      );

  /// Saves the key to a file.
  ///
  /// \param [path] Non-null string filepath where the key will be saved
  /// \return true if the key was successfully stored in the given filepath file, false otherwise
  bool store(String path) =>
      iTWBindings.TWStoredKeyStore(_pointer, TWString(path).pointer);

  /// Decrypts the private key.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Decrypted private key as a block of data if success, null pointer otherwise
  Uint8List decryptPrivateKey(Uint8List password) => TWData.fromPointer(
        iTWBindings.TWStoredKeyDecryptPrivateKey(
          _pointer,
          TWData(password).pointer,
        ),
      ).bytes()!;

  /// Decrypts the mnemonic phrase.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Bip39 decrypted mnemonic if success, null pointer otherwise
  String decryptMnemonic(Uint8List password) => TWString.fromPointer(
        iTWBindings.TWStoredKeyDecryptMnemonic(
          _pointer,
          TWData(password).pointer,
        ),
      ).toString();

  /// Returns the private key for a specific coin.  Returned object needs to be deleted.
  ///
  /// \param [coin] Account coin type to be queried
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Null pointer on failure, pointer to the private key otherwise
  TWPrivateKey privateKey(int coin, Uint8List password) =>
      TWPrivateKey.fromPointer(
        iTWBindings.TWStoredKeyPrivateKey(
          _pointer,
          coin,
          TWData(password).pointer,
        ),
      );

  /// Decrypts and returns the HD Wallet for mnemonic phrase keys.  Returned object needs to be deleted.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Null pointer on failure, pointer to the HDWallet otherwise
  TWHDWallet wallet(Uint8List password) => TWHDWallet.fromPointer(
        iTWBindings.TWStoredKeyWallet(
          _pointer,
          TWData(password).pointer,
        ),
      );

  /// Exports the key as JSON
  Uint8List? exportJSON() => TWData.fromPointer(
        iTWBindings.TWStoredKeyExportJSON(_pointer),
      ).bytes();

  /// Fills in empty and invalid addresses.
  /// This method needs the encryption password to re-derive addresses from private keys.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return `false` if the password is incorrect, true otherwise.
  bool fixAddresses(Uint8List password) =>
      iTWBindings.TWStoredKeyFixAddresses(_pointer, TWData(password).pointer);

  /// Retrieve stored key encoding parameters, as JSON string.
  ///
  /// \param key Non-null pointer to a stored key
  String? get encryptionParameters => TWString.fromPointer(
        iTWBindings.TWStoredKeyEncryptionParameters(_pointer),
      ).value();
}

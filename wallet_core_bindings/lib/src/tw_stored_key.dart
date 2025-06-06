part of '../wallet_core_bindings.dart';

/// TWStoredKey finalizer.
final _twStoredKeyFinalizer = Finalizer<int>((int token) {
  _storedKeyImpl.delete(token);
});

/// Represents a key stored as an encrypted file.
class TWStoredKey extends TWObjectFinalizable {
  TWStoredKey.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twStoredKeyFinalizer,
        );

  /// Loads a key from a file.
  ///
  /// \param [path] filepath to the key as a non-null string
  TWStoredKey.load(
    String path, {
    bool attach = true,
  }) : super(
          _storedKeyImpl.load(TWString(path).pointer),
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
    required TWCoinType coin,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importPrivateKey(
            TWData(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
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
    required TWCoinType coin,
    required TWStoredKeyEncryption encryption,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importPrivateKeyWithEncryption(
            TWData(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
            encryption.value,
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
  /// \param [derivation] derivation of the given coin type
  /// \note Returned object needs to be deleted with \TWStoredKeyDelete
  /// \return Nullptr if the key can't be imported, the stored key otherwise
  TWStoredKey.importPrivateKeyWithEncryptionAndDerivation({
    required Uint8List privateKey,
    required String name,
    required Uint8List password,
    required TWCoinType coin,
    required TWStoredKeyEncryption encryption,
    required TWDerivation derivation,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importPrivateKeyWithEncryptionAndDerivation(
            TWData(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
            encryption.value,
            derivation.value,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports an encoded private key.
  ///
  /// \param [privateKey] Non-null encoded private key
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [coin] the coin type
  /// \note Returned object needs to be deleted with \TWStoredKeyDelete
  /// \return Nullptr if the key can't be imported, the stored key otherwise
  TWStoredKey.importPrivateKeyEncoded({
    required String privateKey,
    required String name,
    required Uint8List password,
    required TWCoinType coin,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importPrivateKeyEncoded(
            TWString(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports an encoded private key.
  ///
  /// \param [privateKey] Non-null encoded private key
  /// \param [name] The name of the stored key to import as a non-null string
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [coin] the coin type
  /// \param [encryption] cipher encryption mode
  /// \note Returned object needs to be deleted with \TWStoredKeyDelete
  /// \return Nullptr if the key can't be imported, the stored key otherwise
  TWStoredKey.importPrivateKeyEncodedWithEncryption({
    required String privateKey,
    required String name,
    required Uint8List password,
    required TWCoinType coin,
    required TWStoredKeyEncryption encryption,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importPrivateKeyEncodedWithEncryption(
            TWString(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
            encryption.value,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports an encoded private key.
  ///
  /// \param [privateKey] Non-null encoded private key
  /// \param [name] The name of the stored key to import as a non-null string
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [coin] the coin type
  /// \param [encryption] cipher encryption mode
  /// \param [derivation] derivation of the given coin type
  /// \note Returned object needs to be deleted with \TWStoredKeyDelete
  /// \return Nullptr if the key can't be imported, the stored key otherwise
  TWStoredKey.importPrivateKeyEncodedWithEncryptionAndDerivation({
    required String privateKey,
    required String name,
    required Uint8List password,
    required TWCoinType coin,
    required TWStoredKeyEncryption encryption,
    required TWDerivation derivation,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importPrivateKeyEncodedWithEncryptionAndDerivation(
            TWString(privateKey).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
            encryption.value,
            derivation.value,
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
    required TWCoinType coin,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importHDWallet(
            TWString(mnemonic).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
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
    required TWCoinType coin,
    required TWStoredKeyEncryption encryption,
    bool attach = true,
  }) : super(
          _storedKeyImpl.importHDWalletWithEncryption(
            TWString(mnemonic).pointer,
            TWString(name).pointer,
            TWData(password).pointer,
            coin.value,
            encryption.value,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Imports a key from JSON.
  ///
  /// \param [json] Json stored key import format as a non-null block of data
  TWStoredKey.importJSON(
    String json, {
    bool attach = true,
  }) : super(
          _storedKeyImpl
              .importJSON(TWData(Uint8List.fromList(json.codeUnits)).pointer),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Creates a new key, with given encryption strength level. Returned object needs to be deleted.
  ///
  /// \param [name] The name of the key to be stored
  /// \param [password] Non-null block of data, password of the stored key
  /// \param [encryptionLevel] The level of encryption, see \TWStoredKeyEncryptionLevel
  /// TW_DEPRECATED_FOR("3.1.1", "[TWStoredKey.createLevelAndEncryption]")
  @Deprecated('Use TWStoredKey.createLevelAndEncryption.')
  TWStoredKey.createLevel({
    required String name,
    required Uint8List password,
    required TWStoredKeyEncryptionLevel encryptionLevel,
    bool attach = true,
  }) : super(
          _storedKeyImpl.createLevel(
            TWString(name).pointer,
            TWData(password).pointer,
            encryptionLevel.value,
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
    required TWStoredKeyEncryptionLevel encryptionLevel,
    required TWStoredKeyEncryption encryption,
    bool attach = true,
  }) : super(
          _storedKeyImpl.createLevelAndEncryption(
            TWString(name).pointer,
            TWData(password).pointer,
            encryptionLevel.value,
            encryption.value,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Creates a new key.
  ///
  /// \deprecated use [TWStoredKey.createLevel].
  /// \param [name] The name of the key to be stored
  /// \param [password] Non-null block of data, password of the stored key
  @Deprecated('Use TWStoredKey.createLevel.')
  TWStoredKey({
    required String name,
    required Uint8List password,
    bool attach = true,
  }) : super(
          _storedKeyImpl.create(
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
  @Deprecated('Use TWStoredKey.createLevel.')
  TWStoredKey.createEncryption({
    required String name,
    required Uint8List password,
    required TWStoredKeyEncryption encryption,
    bool attach = true,
  }) : super(
          _storedKeyImpl.createEncryption(
            TWString(name).pointer,
            TWData(password).pointer,
            encryption.value,
          ),
          attach: attach,
          finalizer: _twStoredKeyFinalizer,
        );

  /// Delete a stored key
  @override
  void delete() {
    super.delete();
    _storedKeyImpl.delete(pointer);
  }

  /// Stored key unique identifier.
  String get identifier =>
      TWString.fromPointer(_storedKeyImpl.identifier(_pointer)).value!;

  /// Stored key namer.
  String get name => TWString.fromPointer(_storedKeyImpl.name(_pointer)).value!;

  /// Whether this key is a mnemonic phrase for a HD wallet.
  bool get isMnemonic => _storedKeyImpl.isMnemonic(_pointer);

  /// The number of accounts.
  int get accountCount => _storedKeyImpl.accountCount(_pointer);

  /// Returns the account at a given index.
  ///
  /// \param [index] the account index to be retrieved
  /// \return Null pointer if the associated account is not found, pointer to the account otherwise.
  TWAccount account(int index) => TWAccount.fromPointer(
        _storedKeyImpl.account(_pointer, index),
      );

  /// Returns the account for a specific coin, creating it if necessary.
  ///
  /// \param [coin] The coin type
  /// \param [wallet] The associated HD wallet, can be null.
  /// \return Null pointer if the associated account is not found/not created, pointer to the account otherwise.
  TWAccount accountForCoin(TWCoinType coin, TWHDWallet wallet) =>
      TWAccount.fromPointer(
          _storedKeyImpl.accountForCoin(_pointer, coin.value, wallet.pointer));

  /// Returns the account for a specific coin + derivation, creating it if necessary.
  ///
  /// \param [coin] The coin type
  /// \param [derivation] The derivation for the given coin
  /// \param [wallet] the associated HD wallet, can be null.
  /// \return Null pointer if the associated account is not found/not created, pointer to the account otherwise.
  TWAccount accountForCoinDerivation({
    required TWCoinType coin,
    required TWDerivation derivation,
    required TWHDWallet wallet,
  }) =>
      TWAccount.fromPointer(_storedKeyImpl.accountForCoinDerivation(
        _pointer,
        coin.value,
        derivation.value,
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
    required TWCoinType coin,
    required TWDerivation derivation,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
  }) =>
      _storedKeyImpl.addAccountDerivation(
        _pointer,
        TWString(address).pointer,
        coin.value,
        derivation.value,
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
  @Deprecated('Use TWStoredKey.addAccountDerivation.')
  void addAccount({
    required String address,
    required TWCoinType coin,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
  }) =>
      _storedKeyImpl.addAccount(
        _pointer,
        TWString(address).pointer,
        coin.value,
        TWString(derivationPath).pointer,
        TWString(publicKey).pointer,
        TWString(extendedPublicKey).pointer,
      );

  /// Remove the account for a specific coin
  ///
  /// \param [coin] Account coin type to be removed
  void removeAccountForCoin(TWCoinType coin) =>
      _storedKeyImpl.removeAccountForCoin(
        _pointer,
        coin.value,
      );

  /// Remove the account for a specific coin with the given derivation.
  ///
  /// \param [coin] Account coin type to be removed
  /// \param [derivation] The derivation of the given coin type
  void removeAccountForCoinDerivation(
          TWCoinType coin, TWDerivation derivation) =>
      _storedKeyImpl.removeAccountForCoinDerivation(
        _pointer,
        coin.value,
        derivation.value,
      );

  /// Remove the account for a specific coin with the given derivation path.
  ///
  /// \param [coin] Account coin type to be removed
  /// \param [derivationPath] The derivation path (bip44) of the given coin type
  void removeAccountForCoinDerivationPath(
          TWCoinType coin, String derivationPath) =>
      _storedKeyImpl.removeAccountForCoinDerivationPath(
        _pointer,
        coin.value,
        TWString(derivationPath).pointer,
      );

  /// Saves the key to a file.
  ///
  /// \param [path] Non-null string filepath where the key will be saved
  /// \return true if the key was successfully stored in the given filepath file, false otherwise
  bool store(String path) =>
      _storedKeyImpl.store(_pointer, TWString(path).pointer);

  /// Decrypts the private key.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Decrypted private key as a block of data if success, null pointer otherwise
  Uint8List decryptPrivateKey(Uint8List password) => TWData.fromPointer(
        _storedKeyImpl.decryptPrivateKey(
          _pointer,
          TWData(password).pointer,
        ),
      ).bytes()!;

  /// Decrypts the encoded private key.
  ///
  /// \param [key] Non-null pointer to a stored key
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Decrypted encoded private key as a string if success, null pointer otherwise
  String? decryptPrivateKeyEncoded(Uint8List password) => TWString.fromPointer(
        _storedKeyImpl.decryptPrivateKeyEncoded(
          _pointer,
          TWData(password).pointer,
        ),
      ).value;

  /// Whether the private key is encoded.
  ///
  /// \param [key] Non-null pointer to a stored key
  /// \return true if the private key is encoded, false otherwise
  bool get hasPrivateKeyEncoded =>
      _storedKeyImpl.hasPrivateKeyEncoded(_pointer);

  /// Decrypts the mnemonic phrase.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Bip39 decrypted mnemonic if success, null pointer otherwise
  String decryptMnemonic(Uint8List password) => TWString.fromPointer(
        _storedKeyImpl.decryptMnemonic(
          _pointer,
          TWData(password).pointer,
        ),
      ).value!;

  /// Returns the private key for a specific coin.  Returned object needs to be deleted.
  ///
  /// \param [coin] Account coin type to be queried
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Null pointer on failure, pointer to the private key otherwise
  TWPrivateKey privateKey(TWCoinType coin, Uint8List password) =>
      TWPrivateKey.fromPointer(
        _storedKeyImpl.privateKey(
          _pointer,
          coin.value,
          TWData(password).pointer,
        ),
      );

  /// Decrypts and returns the HD Wallet for mnemonic phrase keys.  Returned object needs to be deleted.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return Null pointer on failure, pointer to the HDWallet otherwise
  TWHDWallet wallet(Uint8List password) => TWHDWallet.fromPointer(
        _storedKeyImpl.wallet(
          _pointer,
          TWData(password).pointer,
        ),
      );

  /// Exports the key as JSON
  String? exportJSON() {
    final data = TWData.fromPointer(
      _storedKeyImpl.exportJSON(_pointer),
    ).bytes();
    if (data != null) {
      return String.fromCharCodes(data);
    }
    return null;
  }

  /// Fills in empty and invalid addresses.
  /// This method needs the encryption password to re-derive addresses from private keys.
  ///
  /// \param [password] Non-null block of data, password of the stored key
  /// \return `false` if the password is incorrect, true otherwise.
  bool fixAddresses(Uint8List password) =>
      _storedKeyImpl.fixAddresses(_pointer, TWData(password).pointer);

  /// Re-derives address for the account(s) associated with the given coin.
  /// This method can be used if address format has been changed.
  /// In case of multiple accounts, all of them will be updated.
  ///
  /// \param [key] Non-null pointer to a stored key
  /// \param [coin] Account(s) coin type to be updated
  /// \return `false` if there are no accounts associated with the given coin, true otherwise
  bool updateAddress(TWCoinType coin) =>
      _storedKeyImpl.updateAddress(_pointer, coin.value);

  /// Retrieve stored key encoding parameters, as JSON string.
  ///
  /// \param key Non-null pointer to a stored key
  String? get encryptionParameters => TWString.fromPointer(
        _storedKeyImpl.encryptionParameters(_pointer),
      ).value;
}

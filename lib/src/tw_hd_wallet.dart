part of '../wallet_core_bindings.dart';

/// TWHDWallet finalizer.
final _twHDWalletFinalizer = Finalizer<Pointer<bindings.TWHDWallet>>(
    (Pointer<bindings.TWHDWallet> token) {
  iTWBindings.TWHDWalletDelete(token);
});

/// Hierarchical Deterministic (HD) Wallet
class TWHDWallet extends TWObjectFinalizable<bindings.TWHDWallet> {
  TWHDWallet.fromPointer(
    Pointer<bindings.TWHDWallet> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twHDWalletFinalizer,
        );

  /// Creates a new HDWallet with a new random mnemonic with the provided strength in bits.
  ///
  /// \param [strength] strength in bits
  /// \param [passphrase] non-null passphrase
  /// \note Null is returned on invalid strength
  TWHDWallet({
    int strength = 128,
    String passphrase = '',
    bool attach = true,
  }) : super(
          iTWBindings.TWHDWalletCreate(
            strength,
            TWString(passphrase).pointer,
          ),
          attach: attach,
          finalizer: _twHDWalletFinalizer,
        );

  /// Creates an HDWallet from a valid BIP39 English mnemonic and a passphrase.
  ///
  /// \param [mnemonic] non-null Valid BIP39 mnemonic
  /// \param [passphrase]  non-null passphrase
  /// \note Null is returned on invalid mnemonic
  TWHDWallet.createWithMnemonic(
    String mnemonic, {
    String passphrase = '',
    bool attach = true,
  }) : super(
          iTWBindings.TWHDWalletCreateWithMnemonic(
            TWString(mnemonic).pointer,
            TWString(passphrase).pointer,
          ),
          attach: attach,
          finalizer: _twHDWalletFinalizer,
        );

  /// Creates an HDWallet from a BIP39 mnemonic, a passphrase and validation flag.
  ///
  /// \param [mnemonic] non-null Valid BIP39 mnemonic
  /// \param [passphrase]  non-null passphrase
  /// \param [check] validation flag
  /// \note Null is returned on invalid mnemonic
  TWHDWallet.createWithMnemonicCheck(
    String mnemonic,
    bool check, {
    String passphrase = '',
    bool attach = true,
  }) : super(
          iTWBindings.TWHDWalletCreateWithMnemonicCheck(
            TWString(mnemonic).pointer,
            TWString(passphrase).pointer,
            check,
          ),
          attach: attach,
          finalizer: _twHDWalletFinalizer,
        );

  /// Creates an HDWallet from entropy (corresponding to a mnemonic).
  ///
  /// \param [entropy] Non-null entropy data (corresponding to a mnemonic)
  /// \param [passphrase] non-null passphrase
  /// \note Null is returned on invalid input
  TWHDWallet.createWithEntropy(
    Uint8List entropy, {
    String passphrase = '',
    bool attach = true,
  }) : super(
          iTWBindings.TWHDWalletCreateWithEntropy(
            TWData(entropy).pointer,
            TWString(passphrase).pointer,
          ),
          attach: attach,
          finalizer: _twHDWalletFinalizer,
        );

  /// Deletes a wallet.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWHDWalletDelete(_pointer);
  }

  /// Wallet seed.
  ///
  /// \return The wallet seed as a Non-null block of data.
  Uint8List get seed =>
      TWData.fromPointer(iTWBindings.TWHDWalletSeed(_pointer)).bytes()!;

  /// Wallet Mnemonic
  ///
  /// \return The wallet mnemonic as a non-null TWString
  String get mnemonic =>
      TWString.fromPointer(iTWBindings.TWHDWalletMnemonic(_pointer)).value!;

  /// Wallet entropy
  ///
  /// \return The wallet entropy as a non-null block of data.
  Uint8List get entropy =>
      TWData.fromPointer(iTWBindings.TWHDWalletEntropy(_pointer)).bytes()!;

  /// Returns master key.
  ///
  /// \param [curve]  a curve
  TWPrivateKey getMasterKey(int curve) => TWPrivateKey.fromPointer(
      iTWBindings.TWHDWalletGetMasterKey(_pointer, curve));

  /// Generates the default private key for the specified coin, using default derivation.
  ///
  /// \see TWHDWalletGetKey
  /// \see TWHDWalletGetKeyDerivation
  /// \param [coin] a coin type
  /// \return return the default private key for the specified coin
  TWPrivateKey getKeyForCoin(int coin) => TWPrivateKey.fromPointer(
      iTWBindings.TWHDWalletGetKeyForCoin(_pointer, coin));

  /// Generates the default address for the specified coin (without exposing intermediary private key), default derivation.
  ///
  /// \see TWHDWalletGetAddressDerivation
  /// \param [coin] a coin type
  /// \return return the default address for the specified coin as a non-null TWString
  String getAddressForCoin(int coin) => TWString.fromPointer(
          iTWBindings.TWHDWalletGetAddressForCoin(_pointer, coin))
      .value!;

  /// Generates the default address for the specified coin and derivation (without exposing intermediary private key).
  ///
  /// \see TWHDWalletGetAddressForCoin
  /// \param [coin] a coin type
  /// \param [derivation] a (custom) derivation to use
  /// \return return the default address for the specified coin as a non-null TWString
  String getAddressDerivation(int coin, int derivation) =>
      TWString.fromPointer(iTWBindings.TWHDWalletGetAddressDerivation(
              _pointer, coin, derivation))
          .value!;

  /// Generates the private key for the specified derivation path.
  ///
  /// \see TWHDWalletGetKeyForCoin
  /// \see TWHDWalletGetKeyDerivation
  /// \param [coin] a coin type
  /// \param [derivationPath]  a non-null derivation path
  /// \return The private key for the specified derivation path/coin
  TWPrivateKey getKey(int coin, String derivationPath) =>
      TWPrivateKey.fromPointer(iTWBindings.TWHDWalletGetKey(
        _pointer,
        coin,
        TWString(derivationPath).pointer,
      ));

  /// Generates the private key for the specified derivation.
  ///
  /// \see TWHDWalletGetKey
  /// \see TWHDWalletGetKeyForCoin
  /// \param [coin] a coin type
  /// \param [derivation] a (custom) derivation to use
  /// \return The private key for the specified derivation path/coin
  TWPrivateKey getKeyDerivation(int coin, int derivation) =>
      TWPrivateKey.fromPointer(iTWBindings.TWHDWalletGetKeyDerivation(
        _pointer,
        coin,
        derivation,
      ));

  /// Generates the private key for the specified derivation path and curve.
  ///
  /// \param [curve] a curve
  /// \param [derivationPath] a non-null derivation path
  /// \return The private key for the specified derivation path/curve
  TWPrivateKey getKeyByCurve(int curve, String derivationPath) =>
      TWPrivateKey.fromPointer(iTWBindings.TWHDWalletGetKeyByCurve(
        _pointer,
        curve,
        TWString(derivationPath).pointer,
      ));

  /// Shortcut method to generate private key with the specified account/change/address (bip44 standard).
  ///
  /// \see https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki
  ///
  /// \param [coin] a coin type
  /// \param [account] valid bip44 account
  /// \param [change] valid bip44 change
  /// \param [address] valid bip44 address
  /// \return The private key for the specified bip44 parameters
  TWPrivateKey getDerivedKey({
    required int coin,
    required int account,
    required int change,
    required int address,
  }) =>
      TWPrivateKey.fromPointer(iTWBindings.TWHDWalletGetDerivedKey(
        _pointer,
        coin,
        account,
        change,
        address,
      ));

  /// Returns the extended private key (for default 0 account).
  ///
  /// \param [purpose] a purpose
  /// \param [coin] a coin type
  /// \param [version] hd version
  /// \return  Extended private key as a non-null TWString
  String getExtendedPrivateKey({
    required int purpose,
    required int coin,
    required int version,
  }) =>
      TWString.fromPointer(iTWBindings.TWHDWalletGetExtendedPrivateKey(
        _pointer,
        purpose,
        coin,
        version,
      )).value!;

  /// Returns the extended public key (for default 0 account).
  ///
  /// \param [purpose] a purpose
  /// \param [coin] a coin type
  /// \param [version] hd version
  /// \return  Extended public key as a non-null TWString
  String getExtendedPublicKey({
    required int purpose,
    required int coin,
    required int version,
  }) =>
      TWString.fromPointer(iTWBindings.TWHDWalletGetExtendedPublicKey(
        _pointer,
        purpose,
        coin,
        version,
      )).value!;

  /// Returns the extended private key, for custom account.
  ///
  /// \param [purpose] a purpose
  /// \param [coin] a coin type
  /// \param [derivation] a derivation
  /// \param [version] an hd version
  /// \param [account] valid bip44 account
  /// \return  Extended private key as a non-null TWString
  String getExtendedPrivateKeyAccount({
    required int purpose,
    required int coin,
    required int derivation,
    required int version,
    required int account,
  }) =>
      TWString.fromPointer(iTWBindings.TWHDWalletGetExtendedPrivateKeyAccount(
        _pointer,
        purpose,
        coin,
        derivation,
        version,
        account,
      )).value!;

  /// Returns the extended public key, for custom account.
  ///
  /// \param [purpose] a purpose
  /// \param [coin] a coin type
  /// \param [derivation] a derivation
  /// \param [version] an hd version
  /// \param [account] valid bip44 account
  /// \return Extended public key as a non-null TWString
  String getExtendedPublicKeyAccount({
    required int purpose,
    required int coin,
    required int derivation,
    required int version,
    required int account,
  }) =>
      TWString.fromPointer(iTWBindings.TWHDWalletGetExtendedPublicKeyAccount(
        _pointer,
        purpose,
        coin,
        derivation,
        version,
        account,
      )).value!;

  /// Returns the extended private key (for default 0 account with derivation).
  ///
  /// \param [purpose] a purpose
  /// \param [coin] a coin type
  /// \param [derivation] a derivation
  /// \param [version] an hd version
  /// \return  Extended private key as a non-null TWString
  String getExtendedPrivateKeyDerivation({
    required int purpose,
    required int coin,
    required int derivation,
    required int version,
  }) =>
      TWString.fromPointer(
          iTWBindings.TWHDWalletGetExtendedPrivateKeyDerivation(
        _pointer,
        purpose,
        coin,
        derivation,
        version,
      )).value!;

  /// Returns the extended public key (for default 0 account with derivation).
  ///
  /// \param [purpose] a purpose
  /// \param [coin] a coin type
  /// \param [derivation] a derivation
  /// \param [version] an hd version
  /// \return  Extended public key as a non-null TWString
  String getExtendedPublicKeyDerivation({
    required int purpose,
    required int coin,
    required int derivation,
    required int version,
  }) =>
      TWString.fromPointer(iTWBindings.TWHDWalletGetExtendedPublicKeyDerivation(
        _pointer,
        purpose,
        coin,
        derivation,
        version,
      )).value!;

  /// Computes the public key from an extended public key representation.
  ///
  /// \param [extended] extended public key
  /// \param [coin] a coin type
  /// \param [derivationPath] a derivation path
  /// \return Nullable TWPublic key
  static TWPublicKey getPublicKeyFromExtended({
    required String extended,
    required int coin,
    required String derivationPath,
  }) =>
      TWPublicKey.fromPointer(iTWBindings.TWHDWalletGetPublicKeyFromExtended(
        TWString(extended).pointer,
        coin,
        TWString(derivationPath).pointer,
      ));
}

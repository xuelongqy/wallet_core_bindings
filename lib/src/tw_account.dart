part of '../wallet_core_bindings.dart';

/// TWAccount finalizer.
final _twAccountFinalizer =
    Finalizer<Pointer<bindings.TWAccount>>((Pointer<bindings.TWAccount> token) {
  iTWBindings.TWAccountDelete(token);
});

/// Represents an Account in C++ with address, coin type and public key info, an item within a keystore.
class TWAccount extends TWObjectFinalizable<bindings.TWAccount> {
  TWAccount.fromPointer(
    Pointer<bindings.TWAccount> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twAccountFinalizer);

  /// Creates a new Account with an address, a coin type, derivation enum, derivationPath, publicKey,
  /// and extendedPublicKey. Must be deleted with TWAccountDelete after use.
  ///
  /// \param [address] The address of the Account.
  /// \param [coin] The coin type of the Account.
  /// \param [derivation] The derivation of the Account.
  /// \param [derivationPath] The derivation path of the Account.
  /// \param [publicKey] hex encoded public key.
  /// \param [extendedPublicKey] Base58 encoded extended public key.
  TWAccount({
    required String address,
    required int coin,
    required int derivation,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
    bool attach = true,
  }) : super(
          iTWBindings.TWAccountCreate(
            TWString(address).pointer,
            coin,
            derivation,
            TWString(derivationPath).pointer,
            TWString(publicKey).pointer,
            TWString(extendedPublicKey).pointer,
          ),
          attach: attach,
          finalizer: _twAccountFinalizer,
        );

  /// Deletes an account.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWAccountDelete(_pointer);
  }

  /// Returns the address of an account.
  String get address =>
      TWString.fromPointer(iTWBindings.TWAccountAddress(_pointer)).toString();

  /// Return CoinType enum of an account.
  int get coin => iTWBindings.TWAccountCoin(_pointer);

  /// Returns the derivation enum of an account.
  int get derivation => iTWBindings.TWAccountDerivation(_pointer);

  /// Returns hex encoded publicKey of an account.
  String get derivationPath =>
      TWString.fromPointer(iTWBindings.TWAccountDerivationPath(_pointer))
          .toString();

  /// Returns hex encoded publicKey of an account.
  String get publicKey =>
      TWString.fromPointer(iTWBindings.TWAccountPublicKey(_pointer)).toString();

  /// Returns Base58 encoded extendedPublicKey of an account.
  String get extendedPublicKey =>
      TWString.fromPointer(iTWBindings.TWAccountExtendedPublicKey(_pointer))
          .toString();
}

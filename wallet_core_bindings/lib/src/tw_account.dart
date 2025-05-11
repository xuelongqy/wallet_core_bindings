part of '../wallet_core_bindings.dart';

/// TWAccount finalizer.
final _twAccountFinalizer = Finalizer<int>((int token) {
  _accountImpl.delete(token);
});

/// Represents an Account in C++ with address, coin type and public key info, an item within a keystore.
class TWAccount extends TWObjectFinalizable {
  TWAccount.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twAccountFinalizer);

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
    required TWCoinType coin,
    required TWDerivation derivation,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
    bool attach = true,
  }) : super(
          _accountImpl.create(
            TWString(address).pointer,
            coin.value,
            derivation.value,
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
    _accountImpl.delete(_pointer);
  }

  /// Returns the address of an account.
  String get address =>
      TWString.fromPointer(_accountImpl.address(_pointer)).value!;

  /// Return CoinType enum of an account.
  TWCoinType get coin => TWCoinType.find(_accountImpl.coin(_pointer));

  /// Returns the derivation enum of an account.
  TWDerivation get derivation =>
      TWDerivation.find(_accountImpl.derivation(_pointer));

  /// Returns hex encoded publicKey of an account.
  String get derivationPath =>
      TWString.fromPointer(_accountImpl.derivationPath(_pointer)).value!;

  /// Returns hex encoded publicKey of an account.
  String get publicKey =>
      TWString.fromPointer(_accountImpl.publicKey(_pointer)).value!;

  /// Returns Base58 encoded extendedPublicKey of an account.
  String get extendedPublicKey =>
      TWString.fromPointer(_accountImpl.extendedPublicKey(_pointer)).value!;
}

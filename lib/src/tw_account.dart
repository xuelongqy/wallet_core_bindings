part of '../wallet_core_bindings.dart';

/// Represents an Account in C++ with address, coin type and public key info, an item within a keystore.
class TWAccount {
  final Pointer<bindings.TWAccount> _pointer;

  Pointer<bindings.TWAccount> get pointer => _pointer;

  const TWAccount.fromPointer(this._pointer);

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
  }) : _pointer = iTWBindings.TWAccountCreate(
          TWString(address).pointer,
          coin,
          derivation,
          TWString(derivationPath).pointer,
          TWString(publicKey).pointer,
          TWString(extendedPublicKey).pointer,
        );

  /// Deletes an account.
  void delete() => iTWBindings.TWAccountDelete(_pointer);

  /// Returns the address of an account.
  String address() =>
      TWString.fromPointer(iTWBindings.TWAccountAddress(_pointer)).toString();

  /// Return CoinType enum of an account.
  int coin() => iTWBindings.TWAccountCoin(_pointer);

  /// Returns the derivation enum of an account.
  int derivation() => iTWBindings.TWAccountDerivation(_pointer);

  /// Returns hex encoded publicKey of an account.
  String derivationPath() =>
      TWString.fromPointer(iTWBindings.TWAccountDerivationPath(_pointer))
          .toString();

  /// Returns Base58 encoded extendedPublicKey of an account.
  String extendedPublicKey() =>
      TWString.fromPointer(iTWBindings.TWAccountExtendedPublicKey(_pointer))
          .toString();
}

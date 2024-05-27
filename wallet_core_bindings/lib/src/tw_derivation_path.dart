part of '../wallet_core_bindings.dart';

/// TWDerivationPath finalizer.
final _twDerivationPathFinalizer = Finalizer<int>((int token) {
  _derivationPathImpl.delete(token);
});

/// Represents a BIP44 DerivationPath in C++.
class TWDerivationPath extends TWObjectFinalizable {
  TWDerivationPath.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twDerivationPathFinalizer);

  /// Creates a new DerivationPath with a purpose, coin, account, change and address.
  /// Must be deleted with TWDerivationPathDelete after use.
  ///
  /// \param [purpose] The purpose of the Path.
  /// \param [coin] The coin type of the Path.
  /// \param [account] The derivation of the Path.
  /// \param [change] The derivation path of the Path.
  /// \param [address] hex encoded public key.
  TWDerivationPath({
    required int purpose,
    required TWCoinType coin,
    required int account,
    required int change,
    required int address,
    bool attach = true,
  }) : super(
          _derivationPathImpl.create(
            purpose,
            coin.coin,
            account,
            change,
            address,
          ),
          attach: attach,
          finalizer: _twDerivationPathFinalizer,
        );

  /// Creates a new DerivationPath with a string
  ///
  /// \param [string] The string of the Path.
  TWDerivationPath.createWithString(
    String string, {
    bool attach = true,
  }) : super(
          _derivationPathImpl.createWithString(TWString(string).pointer),
          attach: attach,
          finalizer: _twDerivationPathFinalizer,
        );

  /// Deletes a DerivationPath.
  @override
  void delete() {
    super.delete();
    _derivationPathImpl.delete(_pointer);
  }

  /// Returns the index component of a DerivationPath.
  ///
  /// \param [index] The index component of the DerivationPath.
  /// \return DerivationPathIndex or null if index is invalid.
  TWDerivationPathIndex indexAt(int index) => TWDerivationPathIndex.fromPointer(
      _derivationPathImpl.indexAt(_pointer, index));

  /// Returns the indices count of a DerivationPath.
  ///
  /// \return The indices count of the DerivationPath.
  int get indicesCount => _derivationPathImpl.indicesCount(_pointer);

  /// Returns the purpose enum of a DerivationPath.
  ///
  /// \return DerivationPathPurpose.
  int get purpose => _derivationPathImpl.purpose(_pointer);

  /// Returns the coin value of a derivation path.
  ///
  /// \return The coin part of the DerivationPath.
  TWCoinType get coin => TWCoinType.find(_derivationPathImpl.coin(_pointer));

  /// Returns the account value of a derivation path.
  ///
  /// \return the account part of a derivation path.
  int get account => _derivationPathImpl.account(_pointer);

  /// Returns the change value of a derivation path.
  ///
  /// \return The change part of a derivation path.
  int get change => _derivationPathImpl.change(_pointer);

  /// Returns the address value of a derivation path.
  ///
  /// \return The address part of the derivation path.
  int get address => _derivationPathImpl.address(_pointer);

  /// Returns the string description of a derivation path.
  ///
  /// \return The string description of the derivation path.
  String get description =>
      TWString.fromPointer(_derivationPathImpl.description(_pointer)).value!;
}

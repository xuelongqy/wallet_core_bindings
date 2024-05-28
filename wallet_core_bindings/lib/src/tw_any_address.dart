part of '../wallet_core_bindings.dart';

/// TWAnyAddress finalizer.
final _twAnyAddressFinalizer = Finalizer<int>((int token) {
  _anyAddressImpl.delete(token);
});

/// Represents an address in C++ for almost any blockchain.
class TWAnyAddress extends TWObjectFinalizable {
  TWAnyAddress.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twAnyAddressFinalizer);

  /// Creates an address from a string representation and a coin type. Must be deleted with TWAnyAddressDelete after use.
  ///
  /// \param [string] address to create.
  /// \param [coin] coin type of the address.
  TWAnyAddress(
    String string,
    TWCoinType coin, {
    bool attach = true,
  }) : super(
          _anyAddressImpl.createWithString(TWString(string).pointer, coin.coin),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates an bech32 address from a string representation, a coin type and the given hrp. Must be deleted with TWAnyAddressDelete after use.
  ///
  /// \param [string] address to create.
  /// \param [coin] coin type of the address.
  /// \param [hrp] hrp of the address.
  TWAnyAddress.createBech32({
    required String string,
    required TWCoinType coin,
    required String hrp,
    bool attach = true,
  }) : super(
          _anyAddressImpl.createBech32(
              TWString(string).pointer, coin.coin, TWString(hrp).pointer),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates an SS58 address from a string representation, a coin type and the given ss58Prefix. Must be deleted with TWAnyAddressDelete after use.
  ///
  /// \param [string] address to create.
  /// \param [coin] coin type of the address.
  /// \param [ss58Prefix] ss58Prefix of the SS58 address.
  TWAnyAddress.createSS58({
    required String string,
    required TWCoinType coin,
    required int ss58Prefix,
    bool attach = true,
  }) : super(
          _anyAddressImpl.createSS58(
              TWString(string).pointer, coin.coin, ss58Prefix),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates an address from a public key.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [coin] coin type of the address.
  TWAnyAddress.createWithPublicKey(
    TWPublicKey publicKey,
    TWCoinType coin, {
    bool attach = true,
  }) : super(
          _anyAddressImpl.createWithPublicKey(publicKey.pointer, coin.coin),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates an address from a public key and derivation option.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [coin] coin type of the address.
  /// \param [derivation] the custom derivation to use.
  TWAnyAddress.createWithPublicKeyDerivation({
    required TWPublicKey publicKey,
    required TWCoinType coin,
    required TWDerivation derivation,
    bool attach = true,
  }) : super(
          _anyAddressImpl.createWithPublicKeyDerivation(
              publicKey.pointer, coin.coin, derivation.derivation),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates an bech32 address from a public key and a given hrp.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [coin] coin type of the address.
  /// \param [hrp] hrp of the address.
  TWAnyAddress.createBech32WithPublicKey({
    required TWPublicKey publicKey,
    required TWCoinType coin,
    required String hrp,
    bool attach = true,
  }) : super(
          _anyAddressImpl.createBech32WithPublicKey(
              publicKey.pointer, coin.coin, TWString(hrp).pointer),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates an SS58 address from a public key and a given ss58Prefix.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [coin] coin type of the address.
  /// \param [ss58Prefix] ss58Prefix of the SS58 address.
  TWAnyAddress.createSS58WithPublicKey({
    required TWPublicKey publicKey,
    required TWCoinType coin,
    required int ss58Prefix,
    bool attach = true,
  }) : super(
          _anyAddressImpl.createSS58WithPublicKey(
              publicKey.pointer, coin.coin, ss58Prefix),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates a Filecoin address from a public key and a given address type.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [filecoinAddressType] Filecoin address type.
  TWAnyAddress.createWithPublicKeyFilecoinAddressType(
    TWPublicKey publicKey,
    TWFilecoinAddressType filecoinAddressType, {
    bool attach = true,
  }) : super(
          _anyAddressImpl.createWithPublicKeyFilecoinAddressType(
              publicKey.pointer, filecoinAddressType.type),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates a Firo address from a public key and a given address type.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [firoAddressType] Firo address type.
  /// \return TWAnyAddress pointer or nullptr if public key is invalid.
  TWAnyAddress.createWithPublicKeyFiroAddressType(
    TWPublicKey publicKey,
    TWFiroAddressType firoAddressType, {
    bool attach = true,
  }) : super(
          _anyAddressImpl.createWithPublicKeyFiroAddressType(
              publicKey.pointer, firoAddressType.type),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Compares two addresses for equality.
  ///
  /// \param [another] The second address to compare.
  /// \return bool indicating the addresses are equal.
  bool equal(TWAnyAddress another) =>
      _anyAddressImpl.equal(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWAnyAddress.equal].
  @override
  bool operator ==(Object other) => other is TWAnyAddress && equal(other);

  /// Deletes an address.
  @override
  void delete() {
    super.delete();
    _anyAddressImpl.delete(_pointer);
  }

  /// Returns the address string representation.
  String get description =>
      TWString.fromPointer(_anyAddressImpl.description(_pointer)).value!;

  /// Returns coin type of address.
  TWCoinType coin() => TWCoinType.find(_anyAddressImpl.coin(_pointer));

  /// Returns underlaying data (public key or key hash)
  Uint8List get data =>
      TWData.fromPointer(_anyAddressImpl.data(_pointer)).bytes()!;

  /// Determines if the string is a valid Any address.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \return bool indicating if the address is valid.
  static bool isValid(String string, TWCoinType coin) =>
      _anyAddressImpl.isValid(TWString(string).pointer, coin.coin);

  /// Determines if the string is a valid Any address with the given hrp.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \param [hrp] explicit given hrp of the given address.
  /// \return bool indicating if the address is valid.
  static bool isValidBech32({
    required String string,
    required TWCoinType coin,
    required String hrp,
  }) =>
      _anyAddressImpl.isValidBech32(
          TWString(string).pointer, coin.coin, TWString(hrp).pointer);

  /// Determines if the string is a valid Any address with the given SS58 network prefix.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \param [ss58Prefix] ss58Prefix of the given address.
  /// \return bool indicating if the address is valid.
  static bool isValidSS58({
    required String string,
    required TWCoinType coin,
    required int ss58Prefix,
  }) =>
      _anyAddressImpl.isValidSS58(
          TWString(string).pointer, coin.coin, ss58Prefix);

  @override
  int get hashCode => _pointer.hashCode;
}

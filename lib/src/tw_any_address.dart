part of '../wallet_core_bindings.dart';

/// TWAnyAddress finalizer.
final _twAnyAddressFinalizer = Finalizer<Pointer<bindings.TWAnyAddress>>(
    (Pointer<bindings.TWAnyAddress> token) {
  iTWBindings.TWAnyAddressDelete(token);
});

/// Represents an address in C++ for almost any blockchain.
class TWAnyAddress extends TWObjectFinalizable<bindings.TWAnyAddress> {
  TWAnyAddress.fromPointer(
    Pointer<bindings.TWAnyAddress> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twAnyAddressFinalizer);

  /// Creates an address from a string representation and a coin type. Must be deleted with TWAnyAddressDelete after use.
  ///
  /// \param [string] address to create.
  /// \param [coin] coin type of the address.
  TWAnyAddress(
    String string,
    int coin, {
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateWithString(
              TWString(string).pointer, coin),
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
    required int coin,
    required String hrp,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateBech32(
              TWString(string).pointer, coin, TWString(hrp).pointer),
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
    required int coin,
    required int ss58Prefix,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateSS58(
              TWString(string).pointer, coin, ss58Prefix),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates an address from a public key.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [coin] coin type of the address.
  TWAnyAddress.createWithPublicKey({
    required TWPublicKey publicKey,
    required int coin,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateWithPublicKey(publicKey.pointer, coin),
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
    required int coin,
    required int derivation,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateWithPublicKeyDerivation(
              publicKey.pointer, coin, derivation),
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
    required int coin,
    required String hrp,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateBech32WithPublicKey(
              publicKey.pointer, coin, TWString(hrp).pointer),
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
    required int coin,
    required int ss58Prefix,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateSS58WithPublicKey(
              publicKey.pointer, coin, ss58Prefix),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates a Filecoin address from a public key and a given address type.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [filecoinAddressType] Filecoin address type.
  TWAnyAddress.createWithPublicKeyFilecoinAddressType({
    required TWPublicKey publicKey,
    required int filecoinAddressType,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateWithPublicKeyFilecoinAddressType(
              publicKey.pointer, filecoinAddressType),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Creates a Firo address from a public key and a given address type.
  ///
  /// \param [publicKey] derivates the address from the public key.
  /// \param [firoAddressType] Firo address type.
  /// \return TWAnyAddress pointer or nullptr if public key is invalid.
  TWAnyAddress.createWithPublicKeyFiroAddressType({
    required TWPublicKey publicKey,
    required int firoAddressType,
    bool attach = true,
  }) : super(
          iTWBindings.TWAnyAddressCreateWithPublicKeyFiroAddressType(
              publicKey.pointer, firoAddressType),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  /// Compares two addresses for equality.
  ///
  /// \param [another] The second address to compare.
  /// \return bool indicating the addresses are equal.
  bool equal(TWAnyAddress another) =>
      iTWBindings.TWAnyAddressEqual(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWAnyAddress.equal].
  bool operator ==(Object other) => other is TWAnyAddress && equal(other);

  /// Deletes an address.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWAnyAddressDelete(_pointer);
  }

  /// Returns the address string representation.
  String get description =>
      TWString.fromPointer(iTWBindings.TWAnyAddressDescription(_pointer))
          .value!;

  /// Returns coin type of address.
  int coin() => iTWBindings.TWAnyAddressCoin(_pointer);

  /// Returns underlaying data (public key or key hash)
  Uint8List get data =>
      TWData.fromPointer(iTWBindings.TWAnyAddressData(_pointer)).bytes()!;

  /// Determines if the string is a valid Any address.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \return bool indicating if the address is valid.
  static bool isValid(String string, int coin) =>
      iTWBindings.TWAnyAddressIsValid(TWString(string).pointer, coin);

  /// Determines if the string is a valid Any address with the given hrp.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \param [hrp] explicit given hrp of the given address.
  /// \return bool indicating if the address is valid.
  static bool isValidBech32(String string, int coin, String hrp) =>
      iTWBindings.TWAnyAddressIsValidBech32(
          TWString(string).pointer, coin, TWString(hrp).pointer);

  /// Determines if the string is a valid Any address with the given SS58 network prefix.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \param [ss58Prefix] ss58Prefix of the given address.
  /// \return bool indicating if the address is valid.
  static bool isValidSS58(String string, int coin, int ss58Prefix) =>
      iTWBindings.TWAnyAddressIsValidSS58(
          TWString(string).pointer, coin, ss58Prefix);
}

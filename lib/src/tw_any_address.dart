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
  TWAnyAddress({
    required String string,
    required int coin,
    bool attach = true,
  }) : super(
          _twAnyAddressCreateWithString(string, coin),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  static Pointer<bindings.TWAnyAddress> _twAnyAddressCreateWithString(
      String string, int coin) {
    TWString twString = TWString(string);
    Pointer<bindings.TWAnyAddress> res =
        iTWBindings.TWAnyAddressCreateWithString(twString.pointer, coin);
    twString.delete();
    return res;
  }

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
          _twAnyAddressCreateBech32(string, coin, hrp),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  static Pointer<bindings.TWAnyAddress> _twAnyAddressCreateBech32(
      String string, int coin, String hrp) {
    TWString twString = TWString(string);
    TWString twHrp = TWString(hrp);
    Pointer<bindings.TWAnyAddress> res = iTWBindings.TWAnyAddressCreateBech32(
        twString.pointer, coin, twHrp.pointer);
    twString.delete();
    twHrp.delete();
    return res;
  }

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
          _twAnyAddressCreateSS58(string, coin, ss58Prefix),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  static Pointer<bindings.TWAnyAddress> _twAnyAddressCreateSS58(
      String string, int coin, int ss58Prefix) {
    TWString twString = TWString(string);
    Pointer<bindings.TWAnyAddress> res =
        iTWBindings.TWAnyAddressCreateSS58(twString.pointer, coin, ss58Prefix);
    twString.delete();
    return res;
  }

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
          _twAnyAddressCreateBech32WithPublicKey(publicKey, coin, hrp),
          attach: attach,
          finalizer: _twAnyAddressFinalizer,
        );

  static Pointer<bindings.TWAnyAddress> _twAnyAddressCreateBech32WithPublicKey(
      TWPublicKey publicKey, int coin, String hrp) {
    TWString twHrp = TWString(hrp);
    Pointer<bindings.TWAnyAddress> res =
        iTWBindings.TWAnyAddressCreateBech32WithPublicKey(
            publicKey.pointer, coin, twHrp.pointer);
    twHrp.delete();
    return res;
  }

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

  /// Compares two addresses for equality.
  ///
  /// \param [another] The second address to compare.
  /// \return bool indicating the addresses are equal.
  bool equal(TWAnyAddress another) =>
      iTWBindings.TWAnyAddressEqual(_pointer, another._pointer);

  /// Deletes an address.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWAnyAddressDelete(_pointer);
  }

  /// Returns the address string representation.
  String description() {
    TWString twRes =
        TWString.fromPointer(iTWBindings.TWAnyAddressDescription(_pointer));
    String res = twRes.toString();
    twRes.delete();
    return res;
  }

  /// Returns coin type of address.
  int coin() => iTWBindings.TWAnyAddressCoin(_pointer);

  /// Returns underlaying data (public key or key hash)
  TWData data() => TWData.fromPointer(iTWBindings.TWAnyAddressData(_pointer));

  /// Determines if the string is a valid Any address.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \return bool indicating if the address is valid.
  static bool isValid(String string, int coin) {
    TWString twString = TWString(string);
    bool res = iTWBindings.TWAnyAddressIsValid(twString.pointer, coin);
    twString.delete();
    return res;
  }

  /// Determines if the string is a valid Any address with the given hrp.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \param [hrp] explicit given hrp of the given address.
  /// \return bool indicating if the address is valid.
  static bool isValidBech32(String string, int coin, String hrp) {
    TWString twString = TWString(string);
    TWString twHrp = TWString(hrp);
    bool res = iTWBindings.TWAnyAddressIsValidBech32(
        twString.pointer, coin, twHrp.pointer);
    twString.delete();
    twHrp.delete();
    return res;
  }

  /// Determines if the string is a valid Any address with the given SS58 network prefix.
  ///
  /// \param [string] address to validate.
  /// \param [coin] coin type of the address.
  /// \param [ss58Prefix] ss58Prefix of the given address.
  /// \return bool indicating if the address is valid.
  static bool isValidSS58(String string, int coin, int ss58Prefix) {
    TWString twString = TWString(string);
    bool res =
        iTWBindings.TWAnyAddressIsValidSS58(twString.pointer, coin, ss58Prefix);
    twString.delete();
    return res;
  }
}

part of '../wallet_core_bindings.dart';

/// TWGroestlcoinAddress finalizer.
final _twGroestlcoinAddressFinalizer =
    Finalizer<Pointer<bindings.TWGroestlcoinAddress>>(
        (Pointer<bindings.TWGroestlcoinAddress> token) {
  iTWBindings.TWGroestlcoinAddressDelete(token);
});

/// Represents a legacy Groestlcoin address.
class TWGroestlcoinAddress
    extends TWObjectFinalizable<bindings.TWGroestlcoinAddress> {
  TWGroestlcoinAddress.fromPointer(
    Pointer<bindings.TWGroestlcoinAddress> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twGroestlcoinAddressFinalizer,
        );

  /// Create an address from a base58 string representation.
  ///
  /// \param [string] Non-null string
  TWGroestlcoinAddress(
    String string, {
    bool attach = true,
  }) : super(
          iTWBindings.TWGroestlcoinAddressCreateWithString(
            TWString(string).pointer,
          ),
          attach: attach,
          finalizer: _twGroestlcoinAddressFinalizer,
        );

  /// Create an address from a public key and a prefix byte.
  ///
  /// \param [publicKey] Non-null public key
  /// \param [prefix] public key prefix
  TWGroestlcoinAddress.createWithPublicKey(
    TWPublicKey publicKey,
    int prefix, {
    bool attach = true,
  }) : super(
          iTWBindings.TWGroestlcoinAddressCreateWithPublicKey(
            publicKey.pointer,
            prefix,
          ),
          attach: attach,
          finalizer: _twGroestlcoinAddressFinalizer,
        );

  /// Delete a Groestlcoin address
  @override
  void delete() {
    super.delete();
    iTWBindings.TWGroestlcoinAddressDelete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] right Non-null GroestlCoin address to be compared
  /// \return true if both address are equal, false otherwise
  bool equal(TWGroestlcoinAddress another) =>
      iTWBindings.TWGroestlcoinAddressEqual(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWGroestlcoinAddress.equal].
  operator ==(Object other) => other is TWGroestlcoinAddress && equal(other);

  /// Determines if the string is a valid Groestlcoin address.
  ///
  /// \param [string] Non-null string.
  /// \return true if it's a valid address, false otherwise
  static bool isValidString(String string) =>
      iTWBindings.TWGroestlcoinAddressIsValidString(TWString(string).pointer);

  /// Returns the address base58 string representation.
  String get description => TWString.fromPointer(
        iTWBindings.TWGroestlcoinAddressDescription(_pointer),
      ).toString();
}

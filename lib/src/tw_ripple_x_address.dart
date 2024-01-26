part of '../wallet_core_bindings.dart';

/// TWRippleXAddress finalizer.
final _twRippleXAddressFinalizer =
    Finalizer<Pointer<bindings.TWRippleXAddress>>(
        (Pointer<bindings.TWRippleXAddress> token) {
  iTWBindings.TWRippleXAddressDelete(token);
});

/// Represents a Ripple X-address.
class TWRippleXAddress extends TWObjectFinalizable<bindings.TWRippleXAddress> {
  TWRippleXAddress.fromPointer(
    Pointer<bindings.TWRippleXAddress> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twRippleXAddressFinalizer,
        );

  /// Creates an address from a string representation.
  ///
  /// \param [string] Non-null pointer to a string that should be a valid ripple address
  TWRippleXAddress(
    String string, {
    bool attach = true,
  }) : super(
          iTWBindings.TWRippleXAddressCreateWithString(
            TWString(string).pointer,
          ),
          attach: attach,
          finalizer: _twRippleXAddressFinalizer,
        );

  /// Creates an address from a public key and destination tag.
  ///
  /// \param [publicKey] Non-null pointer to a public key
  /// \param tag valid ripple destination tag (1-10)
  TWRippleXAddress.createWithPublicKey(
    TWPublicKey publicKey,
    int tag, {
    bool attach = true,
  }) : super(
          iTWBindings.TWRippleXAddressCreateWithPublicKey(
            publicKey.pointer,
            tag,
          ),
          attach: attach,
          finalizer: _twRippleXAddressFinalizer,
        );

  /// Delete the given ripple address
  @override
  void delete() {
    super.delete();
    iTWBindings.TWRippleXAddressDelete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] right non-null pointer to a Ripple Address
  /// \return true if both address are equal, false otherwise
  bool equal(TWRippleXAddress another) =>
      iTWBindings.TWRippleXAddressEqual(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWRippleXAddress.equal].
  operator ==(Object other) => other is TWRippleXAddress && equal(other);

  /// Determines if the string is a valid Ripple address.
  ///
  /// \param [string] Non-null pointer to a string that represent the Ripple Address to be checked
  /// \return true if the given address is a valid Ripple address, false otherwise
  static bool isValidString(String string) =>
      iTWBindings.TWRippleXAddressIsValidString(TWString(string).pointer);

  /// Returns the address string representation.
  String get description => TWString.fromPointer(
        iTWBindings.TWRippleXAddressDescription(_pointer),
      ).toString();

  /// Returns the destination tag.
  int get tag => iTWBindings.TWRippleXAddressTag(_pointer);
}

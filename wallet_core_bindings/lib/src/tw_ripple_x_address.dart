part of '../wallet_core_bindings.dart';

/// TWRippleXAddress finalizer.
final _twRippleXAddressFinalizer = Finalizer<int>((int token) {
  _rippleXAddressImpl.delete(token);
});

/// Represents a Ripple X-address.
class TWRippleXAddress extends TWObjectFinalizable {
  TWRippleXAddress.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twRippleXAddressFinalizer,
        );

  /// Creates an address from a string representation.
  ///
  /// \param [string] Non-null pointer to a string that should be a valid ripple address
  TWRippleXAddress(
    String string, {
    bool attach = true,
  }) : super(
          _rippleXAddressImpl.createWithString(
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
          _rippleXAddressImpl.createWithPublicKey(
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
    _rippleXAddressImpl.delete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] right non-null pointer to a Ripple Address
  /// \return true if both address are equal, false otherwise
  bool equal(TWRippleXAddress another) =>
      _rippleXAddressImpl.equal(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWRippleXAddress.equal].
  @override
  operator ==(Object other) => other is TWRippleXAddress && equal(other);

  /// Determines if the string is a valid Ripple address.
  ///
  /// \param [string] Non-null pointer to a string that represent the Ripple Address to be checked
  /// \return true if the given address is a valid Ripple address, false otherwise
  static bool isValidString(String string) =>
      _rippleXAddressImpl.isValidString(TWString(string).pointer);

  /// Returns the address string representation.
  String get description => TWString.fromPointer(
        _rippleXAddressImpl.description(_pointer),
      ).value!;

  /// Returns the destination tag.
  int get tag => _rippleXAddressImpl.tag(_pointer);

  @override
  int get hashCode => _pointer.hashCode;
}

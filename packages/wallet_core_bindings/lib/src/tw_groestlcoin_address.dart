part of '../wallet_core_bindings.dart';

/// TWGroestlcoinAddress finalizer.
final _twGroestlcoinAddressFinalizer = Finalizer<int>((int token) {
  _groestlcoinAddressImpl.delete(token);
});

/// Represents a legacy Groestlcoin address.
class TWGroestlcoinAddress extends TWObjectFinalizable {
  TWGroestlcoinAddress.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twGroestlcoinAddressFinalizer,
        );

  /// Create an address from a base58 string representation.
  ///
  /// \param [string] Non-null string
  TWGroestlcoinAddress(
    String string, {
    bool attach = true,
  }) : super(
          _groestlcoinAddressImpl.createWithString(
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
          _groestlcoinAddressImpl.createWithPublicKey(
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
    _groestlcoinAddressImpl.delete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] right Non-null GroestlCoin address to be compared
  /// \return true if both address are equal, false otherwise
  bool equal(TWGroestlcoinAddress another) =>
      _groestlcoinAddressImpl.equal(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWGroestlcoinAddress.equal].
  @override
  operator ==(Object other) => other is TWGroestlcoinAddress && equal(other);

  /// Determines if the string is a valid Groestlcoin address.
  ///
  /// \param [string] Non-null string.
  /// \return true if it's a valid address, false otherwise
  static bool isValidString(String string) =>
      _groestlcoinAddressImpl.isValidString(TWString(string).pointer);

  /// Returns the address base58 string representation.
  String get description => TWString.fromPointer(
        _groestlcoinAddressImpl.description(_pointer),
      ).value!;

  @override
  int get hashCode => _pointer.hashCode;
}

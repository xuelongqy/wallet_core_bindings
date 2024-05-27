part of '../wallet_core_bindings.dart';

/// TWBitcoinAddress finalizer.
final _twBitcoinAddressFinalizer = Finalizer<int>((int token) {
  _bitcoinAddressImpl.delete(token);
});

/// Represents a legacy Bitcoin address in C++.
class TWBitcoinAddress extends TWObjectFinalizable {
  TWBitcoinAddress.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twBitcoinAddressFinalizer);

  /// Initializes an address from a Base58 sring. Must be deleted with TWBitcoinAddressDelete after use.
  ///
  /// \param [string] Base58 string to initialize the address from.
  TWBitcoinAddress(
    String string, {
    bool attach = true,
  }) : super(
          _bitcoinAddressImpl.createWithString(TWString(string).pointer),
          attach: attach,
          finalizer: _twBitcoinAddressFinalizer,
        );

  /// Initializes an address from raw data.
  ///
  /// \param [data] Raw data to initialize the address from. Must be deleted with TWBitcoinAddressDelete after use.
  TWBitcoinAddress.createWithData(
    Uint8List data, {
    bool attach = true,
  }) : super(
          _bitcoinAddressImpl.createWithData(TWData(data).pointer),
          attach: attach,
          finalizer: _twBitcoinAddressFinalizer,
        );

  /// Initializes an address from a public key and a prefix byte.
  ///
  /// \param [publicKey] Public key to initialize the address from.
  /// \param [prefix] Prefix byte (p2pkh, p2sh, etc).
  TWBitcoinAddress.createWithPublicKey(
    TWPublicKey publicKey,
    int prefix, {
    bool attach = true,
  }) : super(
          _bitcoinAddressImpl.createWithPublicKey(publicKey.pointer, prefix),
          attach: attach,
          finalizer: _twBitcoinAddressFinalizer,
        );

  /// Deletes a legacy Bitcoin address.
  @override
  void delete() {
    super.delete();
    _bitcoinAddressImpl.delete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] The second address to compare.
  /// \return bool indicating the addresses are equal.
  bool equal(TWBitcoinAddress another) =>
      _bitcoinAddressImpl.equal(_pointer, another.pointer);

  /// Overloaded operator ==, equivalent to [TWBitcoinAddress.equal].
  @override
  bool operator ==(Object other) => other is TWBitcoinAddress && equal(other);

  /// Determines if the data is a valid Bitcoin address.
  ///
  /// \param [data] data to validate.
  /// \return bool indicating if the address data is valid.
  static bool isValid(Uint8List data) =>
      _bitcoinAddressImpl.isValid(TWData(data).pointer);

  /// Determines if the string is a valid Bitcoin address.
  ///
  /// \param [string] string to validate.
  /// \return bool indicating if the address string is valid.
  static bool isValidString(String string) =>
      _bitcoinAddressImpl.isValidString(TWString(string).pointer);

  /// Returns the address in Base58 string representation.
  String get description =>
      TWString.fromPointer(_bitcoinAddressImpl.description(_pointer)).value!;

  /// Returns the address prefix.
  int get prefix => _bitcoinAddressImpl.prefix(_pointer);

  /// Returns the key hash data.
  Uint8List get keyHash =>
      TWData.fromPointer(_bitcoinAddressImpl.keyHash(_pointer)).bytes()!;

  /// Returns the address data.
  Uint8List get data => Uint8List.fromList([prefix, ...keyHash]);

  @override
  int get hashCode => _pointer.hashCode;
}

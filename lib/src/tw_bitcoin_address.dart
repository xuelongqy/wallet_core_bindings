part of '../wallet_core_bindings.dart';

/// TWBitcoinAddress finalizer.
final _twBitcoinAddressFinalizer =
    Finalizer<Pointer<bindings.TWBitcoinAddress>>(
        (Pointer<bindings.TWBitcoinAddress> token) {
  iTWBindings.TWBitcoinAddressDelete(token);
});

/// Represents a legacy Bitcoin address in C++.
class TWBitcoinAddress extends TWObjectFinalizable<bindings.TWBitcoinAddress> {
  TWBitcoinAddress.fromPointer(
    Pointer<bindings.TWBitcoinAddress> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twBitcoinAddressFinalizer);

  /// Initializes an address from a Base58 sring. Must be deleted with TWBitcoinAddressDelete after use.
  ///
  /// \param [string] Base58 string to initialize the address from.
  TWBitcoinAddress(
    String string, {
    bool attach = true,
  }) : super(
          iTWBindings.TWBitcoinAddressCreateWithString(
              TWString(string).pointer),
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
          iTWBindings.TWBitcoinAddressCreateWithData(TWData(data).pointer),
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
          iTWBindings.TWBitcoinAddressCreateWithPublicKey(
              publicKey.pointer, prefix),
          attach: attach,
          finalizer: _twBitcoinAddressFinalizer,
        );

  /// Deletes a legacy Bitcoin address.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWBitcoinAddressDelete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] The second address to compare.
  /// \return bool indicating the addresses are equal.
  bool equal(TWBitcoinAddress another) =>
      iTWBindings.TWBitcoinAddressEqual(_pointer, another.pointer);

  /// Overloaded operator ==, equivalent to [TWBitcoinAddress.equal].
  bool operator ==(Object other) => other is TWBitcoinAddress && equal(other);

  /// Determines if the data is a valid Bitcoin address.
  ///
  /// \param [data] data to validate.
  /// \return bool indicating if the address data is valid.
  static bool isValid(Uint8List data) =>
      iTWBindings.TWBitcoinAddressIsValid(TWData(data).pointer);

  /// Determines if the string is a valid Bitcoin address.
  ///
  /// \param [string] string to validate.
  /// \return bool indicating if the address string is valid.
  static bool isValidString(String string) =>
      iTWBindings.TWBitcoinAddressIsValidString(TWString(string).pointer);

  /// Returns the address in Base58 string representation.
  String get description =>
      TWString.fromPointer(iTWBindings.TWBitcoinAddressDescription(_pointer))
          .value!;

  /// Returns the address prefix.
  int get prefix => iTWBindings.TWBitcoinAddressPrefix(_pointer);

  /// Returns the key hash data.
  Uint8List get keyHash =>
      TWData.fromPointer(iTWBindings.TWBitcoinAddressKeyhash(_pointer))
          .bytes()!;

  /// Returns the address data.
  Uint8List get data => Uint8List.fromList([prefix, ...keyHash]);
}

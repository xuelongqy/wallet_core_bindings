part of '../wallet_core_bindings.dart';

/// TWNervosAddress finalizer.
final _twNervosAddressFinalizer = Finalizer<Pointer<bindings.TWNervosAddress>>(
    (Pointer<bindings.TWNervosAddress> token) {
  iTWBindings.TWNervosAddressDelete(token);
});

/// Represents a Nervos address.
class TWNervosAddress extends TWObjectFinalizable<bindings.TWNervosAddress> {
  TWNervosAddress.fromPointer(
    Pointer<bindings.TWNervosAddress> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twNervosAddressFinalizer,
        );

  /// Initializes an address from a sring representaion.
  ///
  /// \param [string] Bech32 string to initialize the address from.
  /// \return TWNervosAddress pointer or nullptr if string is invalid.
  TWNervosAddress(
    String string, {
    bool attach = true,
  }) : super(
          iTWBindings.TWNervosAddressCreateWithString(TWString(string).pointer),
          attach: attach,
          finalizer: _twNervosAddressFinalizer,
        );

  /// Deletes a Nervos address.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWNervosAddressDelete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] The second address to compare.
  /// \return bool indicating the addresses are equal.
  bool equal(TWNervosAddress another) =>
      iTWBindings.TWNervosAddressEqual(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWNervosAddress.equal].
  operator ==(Object other) => other is TWNervosAddress && equal(other);

  /// Determines if the string is a valid Nervos address.
  ///
  /// \param [string] string to validate.
  /// \return bool indicating if the address is valid.
  static bool isValidString(String string) =>
      iTWBindings.TWNervosAddressIsValidString(TWString(string).pointer);

  /// Returns the address string representation.
  String get description => TWString.fromPointer(
        iTWBindings.TWNervosAddressDescription(_pointer),
      ).toString();

  /// Returns the Code hash
  Uint8List get codeHash => TWData.fromPointer(
        iTWBindings.TWNervosAddressCodeHash(_pointer),
      ).bytes()!;

  /// Returns the address hash type
  String get hashType => TWString.fromPointer(
        iTWBindings.TWNervosAddressHashType(_pointer),
      ).toString();

  /// Returns the address args data.
  Uint8List get args => TWData.fromPointer(
        iTWBindings.TWNervosAddressArgs(_pointer),
      ).bytes()!;
}

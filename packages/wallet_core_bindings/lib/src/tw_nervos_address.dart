part of '../wallet_core_bindings.dart';

/// TWNervosAddress finalizer.
final _twNervosAddressFinalizer = Finalizer<int>((int token) {
  _nervosAddressImpl.delete(token);
});

/// Represents a Nervos address.
class TWNervosAddress extends TWObjectFinalizable {
  TWNervosAddress.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
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
          _nervosAddressImpl.createWithString(TWString(string).pointer),
          attach: attach,
          finalizer: _twNervosAddressFinalizer,
        );

  /// Deletes a Nervos address.
  @override
  void delete() {
    super.delete();
    _nervosAddressImpl.description(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] The second address to compare.
  /// \return bool indicating the addresses are equal.
  bool equal(TWNervosAddress another) =>
      _nervosAddressImpl.equal(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWNervosAddress.equal].
  @override
  operator ==(Object other) => other is TWNervosAddress && equal(other);

  /// Determines if the string is a valid Nervos address.
  ///
  /// \param [string] string to validate.
  /// \return bool indicating if the address is valid.
  static bool isValidString(String string) =>
      _nervosAddressImpl.isValidString(TWString(string).pointer);

  /// Returns the address string representation.
  String get description => TWString.fromPointer(
        _nervosAddressImpl.description(_pointer),
      ).value!;

  /// Returns the Code hash
  Uint8List get codeHash => TWData.fromPointer(
        _nervosAddressImpl.codeHash(_pointer),
      ).bytes()!;

  /// Returns the address hash type
  String get hashType => TWString.fromPointer(
        _nervosAddressImpl.hashType(_pointer),
      ).value!;

  /// Returns the address args data.
  Uint8List get args => TWData.fromPointer(
        _nervosAddressImpl.args(_pointer),
      ).bytes()!;

  @override
  int get hashCode => _pointer.hashCode;
}

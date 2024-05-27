part of '../wallet_core_bindings.dart';

/// TWSegwitAddress finalizer.
final _twSegwitAddressFinalizer = Finalizer<int>((int token) {
  _segwitAddressImpl.delete(token);
});

/// Represents a BIP 0173 address.
class TWSegwitAddress extends TWObjectFinalizable {
  TWSegwitAddress.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twSegwitAddressFinalizer,
        );

  /// Creates an address from a string representation.
  ///
  /// \param [string] Non-null pointer to a Bech32 address as a string
  TWSegwitAddress(
    String string, {
    bool attach = true,
  }) : super(
          _segwitAddressImpl.createWithString(
            TWString(string).pointer,
          ),
          attach: attach,
          finalizer: _twSegwitAddressFinalizer,
        );

  /// Creates a segwit-version-0 address from a public key and HRP prefix.
  /// Taproot (v>=1) is not supported by this method.
  ///
  /// \param [hrp] HRP of the utxo coin targeted
  /// \param [publicKey] Non-null pointer to the public key of the targeted coin
  TWSegwitAddress.createWithPublicKey(
    TWHRP hrp,
    TWPublicKey publicKey, {
    bool attach = true,
  }) : super(
          _segwitAddressImpl.createWithPublicKey(
            hrp.hrp,
            publicKey.pointer,
          ),
          attach: attach,
          finalizer: _twSegwitAddressFinalizer,
        );

  /// Delete the given Segwit address
  @override
  void delete() {
    super.delete();
    _segwitAddressImpl.delete(_pointer);
  }

  /// Compares two addresses for equality.
  ///
  /// \param [another] right non-null pointer to a Bech32 Address
  /// \return true if both address are equal, false otherwise
  bool equal(TWSegwitAddress another) =>
      _segwitAddressImpl.equal(_pointer, another._pointer);

  /// Overloaded operator ==, equivalent to [TWSegwitAddress.equal].
  @override
  operator ==(Object other) => other is TWSegwitAddress && equal(other);

  /// Determines if the string is a valid Bech32 address.
  ///
  /// \param [string] Non-null pointer to a Bech32 address as a string
  /// \return true if the string is a valid Bech32 address, false otherwise.
  static bool isValidString(String string) =>
      _segwitAddressImpl.isValidString(TWString(string).pointer);

  /// Returns the address string representation.
  String get description => TWString.fromPointer(
        _segwitAddressImpl.description(_pointer),
      ).value!;

  /// Returns the human-readable part.
  TWHRP get hrp => TWHRP.find(_segwitAddressImpl.hrp(_pointer));

  /// Returns the human-readable part.
  int get witnessVersion => _segwitAddressImpl.witnessVersion(_pointer);

  /// Returns the witness program
  Uint8List get witnessProgram => TWData.fromPointer(
        _segwitAddressImpl.witnessProgram(_pointer),
      ).bytes()!;

  @override
  int get hashCode => _pointer.hashCode;
}

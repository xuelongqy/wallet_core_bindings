part of '../wallet_core_bindings.dart';

/// TWSolanaAddress finalizer.
final _twSolanaAddressFinalizer = Finalizer<Pointer<bindings.TWSolanaAddress>>(
    (Pointer<bindings.TWSolanaAddress> token) {
  iTWBindings.TWSolanaAddressDelete(token);
});

/// Solana address helper functions
class TWSolanaAddress extends TWObjectFinalizable<bindings.TWSolanaAddress> {
  TWSolanaAddress.fromPointer(
    Pointer<bindings.TWSolanaAddress> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twSolanaAddressFinalizer,
        );

  /// Creates an address from a string representation.
  ///
  /// \param [string] Non-null pointer to a solana address string
  TWSolanaAddress(
    String string, {
    bool attach = true,
  }) : super(
          iTWBindings.TWSolanaAddressCreateWithString(
            TWString(string).pointer,
          ),
          attach: attach,
          finalizer: _twSolanaAddressFinalizer,
        );

  /// Delete the given Solana address
  @override
  void delete() {
    super.delete();
    iTWBindings.TWSolanaAddressDelete(_pointer);
  }

  /// Derive default token address for token
  ///
  /// \param [address] Non-null pointer to a Solana Address
  /// \param [tokenMintAddress] Non-null pointer to a token mint address as a string
  /// \return Null pointer if the Default token address for a token is not found, valid pointer otherwise
  String defaultTokenAddress(String tokenMintAddress) => TWString.fromPointer(
        iTWBindings.TWSolanaAddressDefaultTokenAddress(
          _pointer,
          TWString(tokenMintAddress).pointer,
        ),
      ).value!;

  /// Returns the address string representation.
  String get description => TWString.fromPointer(
        iTWBindings.TWSolanaAddressDescription(_pointer),
      ).value!;
}

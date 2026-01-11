part of '../wallet_core_bindings.dart';

/// TWSolanaAddress finalizer.
final _twSolanaAddressFinalizer = Finalizer<int>((int token) {
  _solanaAddressImpl.delete(token);
});

/// Solana address helper functions
class TWSolanaAddress extends TWObjectFinalizable {
  TWSolanaAddress.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twSolanaAddressFinalizer,
        );

  /// Creates an address from a string representation.
  ///
  /// \param [string] Non-null pointer to a solana address string
  TWSolanaAddress(
    String string, {
    bool attach = true,
  }) : super(
          _solanaAddressImpl.createWithString(
            TWString(string).pointer,
          ),
          attach: attach,
          finalizer: _twSolanaAddressFinalizer,
        );

  /// Delete the given Solana address
  @override
  void delete() {
    super.delete();
    _solanaAddressImpl.delete(_pointer);
  }

  /// Derive default token address for token
  ///
  /// \param [address] Non-null pointer to a Solana Address
  /// \param [tokenMintAddress] Non-null pointer to a token mint address as a string
  /// \return Null pointer if the Default token address for a token is not found, valid pointer otherwise
  String? defaultTokenAddress(String tokenMintAddress) => TWString.fromPointer(
        _solanaAddressImpl.defaultTokenAddress(
          _pointer,
          TWString(tokenMintAddress).pointer,
        ),
      ).value;

  /// Derive token 2022 address for token
  ///
  /// \param [address] Non-null pointer to a Solana Address
  /// \param [tokenMintAddress] Non-null pointer to a token mint address as a string
  /// \return Null pointer if the token 2022 address for a token is not found, valid pointer otherwise
  String? token2022Address(String tokenMintAddress) => TWString.fromPointer(
        _solanaAddressImpl.token2022Address(
          _pointer,
          TWString(tokenMintAddress).pointer,
        ),
      ).value;

  /// Returns the address string representation.
  String get description => TWString.fromPointer(
        _solanaAddressImpl.description(_pointer),
      ).value!;
}

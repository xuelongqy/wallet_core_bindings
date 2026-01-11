part of '../wallet_core_bindings.dart';

/// Represents a WalletConnect signing request.
class TWWalletConnectRequest {
  TWWalletConnectRequest._();

  /// Parses the WalletConnect signing request as a `SigningInput`.
  ///
  /// \param [coin] The given coin type to plan the transaction for.
  /// \param [input] The serialized data of a `WalletConnect::Proto::ParseRequestInput` proto object.
  /// \return The serialized data of `WalletConnect::Proto::ParseRequestOutput` proto object.
  static Uint8List parse(TWCoinType coin, Uint8List input) =>
      TWData.fromPointer(
        _walletConnectRequestImpl.parse(
          coin.value,
          TWData(input).pointer,
        ),
      ).bytes()!;
}

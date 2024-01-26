part of '../wallet_core_bindings.dart';

/// Filecoin-Ethereum address converter.
class TWFilecoinAddressConverter {
  /// Converts a Filecoin address to Ethereum.
  ///
  /// \param [filecoinAddress] a Filecoin address.
  /// \returns the Ethereum address. On invalid input empty string is returned. Returned object needs to be deleted after use.
  String convertToEthereum(String filecoinAddress) => TWString.fromPointer(
        iTWBindings.TWFilecoinAddressConverterConvertToEthereum(
          TWString(filecoinAddress).pointer,
        ),
      ).value!;

  /// Converts an Ethereum address to Filecoin.
  ///
  /// \param [ethAddress] an Ethereum address.
  /// \returns the Filecoin address. On invalid input empty string is returned. Returned object needs to be deleted after use.
  String convertFromEthereum(String ethAddress) => TWString.fromPointer(
        iTWBindings.TWFilecoinAddressConverterConvertFromEthereum(
          TWString(ethAddress).pointer,
        ),
      ).value!;
}

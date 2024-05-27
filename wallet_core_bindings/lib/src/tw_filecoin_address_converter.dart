part of '../wallet_core_bindings.dart';

/// Filecoin-Ethereum address converter.
class TWFilecoinAddressConverter {
  TWFilecoinAddressConverter._();

  /// Converts a Filecoin address to Ethereum.
  ///
  /// \param [filecoinAddress] a Filecoin address.
  /// \returns the Ethereum address. On invalid input empty string is returned. Returned object needs to be deleted after use.
  static String convertToEthereum(String filecoinAddress) =>
      TWString.fromPointer(
        _filecoinAddressConverterImpl.convertToEthereum(
          TWString(filecoinAddress).pointer,
        ),
      ).value!;

  /// Converts an Ethereum address to Filecoin.
  ///
  /// \param [ethAddress] an Ethereum address.
  /// \returns the Filecoin address. On invalid input empty string is returned. Returned object needs to be deleted after use.
  static String convertFromEthereum(String ethAddress) => TWString.fromPointer(
        _filecoinAddressConverterImpl.convertFromEthereum(
          TWString(ethAddress).pointer,
        ),
      ).value!;
}

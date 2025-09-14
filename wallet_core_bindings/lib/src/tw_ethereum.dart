part of '../wallet_core_bindings.dart';

class TWEthereum {
  TWEthereum._();

  /// Returns the checksummed address.
  ///
  /// \param [address] non-null Ethereum address string
  /// \return the checksummed address
  static String? addressChecksummed({required String address}) =>
      TWString.fromPointer(_ethereumImpl.addressChecksummed(
        TWString(address).pointer,
      )).value;

  /// Generate a layer 2 eip2645 derivation path from eth address, layer, application and given index.
  ///
  /// \param [ethAddress] non-null Ethereum address
  /// \param [layer]  non-null layer 2 name (E.G starkex)
  /// \param [application] non-null layer 2 application (E.G immutablex)
  /// \param [index] non-null layer 2 index (E.G 1)
  /// \return a valid eip2645 layer 2 derivation path as a string
  static String eip2645GetPath({
    required String ethAddress,
    required String layer,
    required String application,
    required String index,
  }) =>
      TWString.fromPointer(_ethereumImpl.eip2645GetPath(
        TWString(ethAddress).pointer,
        TWString(layer).pointer,
        TWString(application).pointer,
        TWString(index).pointer,
      )).value!;

  /// Returns EIP-1014 Create2 address
  ///
  /// \param [from] non-null string
  /// \param [salt] non-null data
  /// \param [initCodeHash] non-null data
  /// \return the EIP-1014 Create2 address
  static String? eip1014Create2Address({
    required String from,
    required Uint8List salt,
    required Uint8List initCodeHash,
  }) =>
      TWString.fromPointer(_ethereumImpl.eip1014Create2Address(
        TWString(from).pointer,
        TWData(salt).pointer,
        TWData(initCodeHash).pointer,
      )).value;

  /// Returns EIP-1967 proxy init code
  ///
  /// \param [logicAddress] non-null string
  /// \param [data] non-null data
  /// \return the EIP-1967 proxy init code
  static Uint8List? eip1967ProxyInitCode({
    required String logicAddress,
    required Uint8List data,
  }) =>
      TWData.fromPointer(_ethereumImpl.eip1967ProxyInitCode(
        TWString(logicAddress).pointer,
        TWData(data).pointer,
      )).bytes();
}

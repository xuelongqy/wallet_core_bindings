part of '../wallet_core_bindings.dart';

class TWEthereum {
  TWEthereum._();

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
}

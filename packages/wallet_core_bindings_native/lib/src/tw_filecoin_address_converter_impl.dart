part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWFilecoinAddressConverter].
class TWFilecoinAddressConverterImpl
    extends TWFilecoinAddressConverterInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWFilecoinAddressConverterImpl(this.bindings);

  @override
  int convertFromEthereum(int filecoinAddress) {
    return bindings.TWFilecoinAddressConverterConvertFromEthereum(
      Pointer.fromAddress(filecoinAddress),
    ).address;
  }

  @override
  int convertToEthereum(int filecoinAddress) {
    return bindings.TWFilecoinAddressConverterConvertToEthereum(
      Pointer.fromAddress(filecoinAddress),
    ).address;
  }
}

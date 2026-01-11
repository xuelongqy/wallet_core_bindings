part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTONAddressConverter].
class TWTONAddressConverterImpl extends TWTONAddressConverterInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTONAddressConverterImpl(this.bindings);

  @override
  int fromBoc(int boc) {
    return bindings.TWTONAddressConverterFromBoc(
      Pointer.fromAddress(boc),
    ).address;
  }

  @override
  int toBoc(int address) {
    return bindings.TWTONAddressConverterToBoc(
      Pointer.fromAddress(address),
    ).address;
  }

  @override
  int toUserFriendly(int address, bool bounceable, bool testnet) {
    return bindings.TWTONAddressConverterToUserFriendly(
      Pointer.fromAddress(address),
      bounceable,
      testnet,
    ).address;
  }
}

part of '../wallet_core_bindings.dart';

/// TON address operations.
class TWTONAddressConverter {
  TWTONAddressConverter._();

  /// Converts a TON user address into a Bag of Cells (BoC) with a single root Cell.
  /// The function is mostly used to request a Jetton user address via `get_wallet_address` RPC.
  /// https://docs.ton.org/develop/dapps/asset-processing/jettons#retrieving-jetton-wallet-addresses-for-a-given-user
  ///
  /// \param [address] Address to be converted into a Bag Of Cells (BoC).
  /// \return Pointer to a base64 encoded Bag Of Cells (BoC). Null if invalid address provided.
  static String? toBoc(String address) {
    return TWString.fromPointer(
            _tonAddressConverterImpl.toBoc(TWString(address).pointer))
        .value;
  }

  /// Parses a TON address from a Bag of Cells (BoC) with a single root Cell.
  /// The function is mostly used to parse a Jetton user address received on `get_wallet_address` RPC.
  /// https://docs.ton.org/develop/dapps/asset-processing/jettons#retrieving-jetton-wallet-addresses-for-a-given-user
  ///
  /// \param [boc] Base64 encoded Bag Of Cells (BoC).
  /// \return Pointer to a Jetton address.
  static String? fromBoc(String boc) {
    return TWString.fromPointer(
            _tonAddressConverterImpl.fromBoc(TWString(boc).pointer))
        .value;
  }

  /// Converts any TON address format to user friendly with the given parameters.
  ///
  /// \param address raw or user-friendly address to be converted.
  /// \param bounceable whether the result address should be bounceable.
  /// \param testnet whether the result address should be testnet.
  static String? toUserFriendly(String address, bool bounceable, bool testnet) {
    return TWString.fromPointer(_tonAddressConverterImpl.toUserFriendly(
            TWString(address).pointer, bounceable, testnet))
        .value;
  }
}

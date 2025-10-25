part of '../wallet_core_bindings.dart';

/// EIP-7702 functions
class TWEip7702 {
  TWEip7702._();

  /// Signs an Authorization hash in [EIP-7702 format](https://eips.ethereum.org/EIPS/eip-7702)
  ///
  /// \param [chainId] The chain ID of the user.
  /// \param [contractAddress] The address of the smart contract wallet.
  /// \param [nonce] The nonce of the user.
  /// \param [privateKey] The private key of the user.
  /// \return The signed authorization.
  static String? signAuthorization({
    required Uint8List chainId,
    required String contractAddress,
    required Uint8List nonce,
    required String privateKey,
  }) =>
      TWString.fromPointer(_eip7702Impl.signAuthorization(
        TWData(chainId).pointer,
        TWString(contractAddress).pointer,
        TWData(nonce).pointer,
        TWString(privateKey).pointer,
      )).value;

  /// Computes an Authorization hash in [EIP-7702 format](https://eips.ethereum.org/EIPS/eip-7702)
  /// `keccak256('0x05' || rlp([chain_id, address, nonce]))`.
  ///
  /// \param [chainId] The chain ID of the user.
  /// \param [contractAddress] The address of the smart contract wallet.
  /// \param [nonce] The nonce of the user.
  /// \return The authorization hash.
  static Uint8List? getAuthorizationHash({
    required Uint8List chainId,
    required String contractAddress,
    required Uint8List nonce,
  }) =>
      TWData.fromPointer(_eip7702Impl.getAuthorizationHash(
        TWData(chainId).pointer,
        TWString(contractAddress).pointer,
        TWData(nonce).pointer,
      )).bytes();
}

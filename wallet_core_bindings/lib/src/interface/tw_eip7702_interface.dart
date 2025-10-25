part of '../../wallet_core_bindings.dart';

/// [TWEip7702] interface.
abstract class TWEip7702Interface {
  /// Signs an Authorization hash in [EIP-7702 format](https://eips.ethereum.org/EIPS/eip-7702)
  ///
  /// \param chainId The chain ID of the user.
  /// \param contractAddress The address of the smart contract wallet.
  /// \param nonce The nonce of the user.
  /// \param privateKey The private key of the user.
  /// \return The signed authorization.
  int signAuthorization(
      int chainId, int contractAddress, int nonce, int privateKey);

  /// Computes an Authorization hash in [EIP-7702 format](https://eips.ethereum.org/EIPS/eip-7702)
  /// `keccak256('0x05' || rlp([chain_id, address, nonce]))`.
  ///
  /// \param chainId The chain ID of the user.
  /// \param contractAddress The address of the smart contract wallet.
  /// \param nonce The nonce of the user.
  /// \return The authorization hash.
  int getAuthorizationHash(int chainId, int contractAddress, int nonce);
}

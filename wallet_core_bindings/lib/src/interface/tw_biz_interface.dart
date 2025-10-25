part of '../../wallet_core_bindings.dart';

/// [TWBiz] interface.
abstract class TWBizInterface {
  /// Returns the encoded hash of the user operation
  ///
  /// \param chainId The chain ID of the user.
  /// \param codeAddress The address of the smart contract wallet.
  /// \param codeName The name of the smart contract wallet.
  /// \param codeVersion The version of the smart contract wallet.
  /// \param typeHash The type hash of the smart contract wallet.
  /// \param domainSeparatorHash The domain separator hash of the smart contract wallet.
  /// \param sender The sender of the smart contract wallet.
  /// \param userOpHash The user operation hash of the smart contract wallet.
  /// \return The encoded hash.
  int getEncodedHash(
    int chainId,
    int codeAddress,
    int codeName,
    int codeVersion,
    int typeHash,
    int domainSeparatorHash,
    int sender,
    int userOpHash,
  );

  /// Signs a message using the private key
  ///
  /// \param hash The hash of the user.
  /// \param privateKey The private key of the user.
  /// \return The signed hash.
  int getSignedHash(int hash, int privateKey);

  /// Encodes `Biz.registerSession` function call to register a session passkey public key.
  ///
  /// \param sessionPasskeyPublicKey The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \param validUntilTimestamp The timestamp until which the session is valid. Big endian uint64.
  /// \return ABI-encoded function call.
  int encodeRegisterSessionCall(
      int sessionPasskeyPublicKey, int validUntilTimestamp);

  /// Encodes `Biz.removeSession` function call to deregister a session passkey public key.
  ///
  /// \param sessionPasskeyPublicKey The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \return ABI-encoded function call.
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey);

  /// Encodes Biz Passkey Session nonce.
  ///
  /// \param nonce The nonce of the Biz Passkey Session account.
  /// \return uint256 represented as [passkey_nonce_key_192, nonce_64].
  int encodePasskeySessionNonce(int nonce);

  /// Encodes `Biz.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param input The serialized data of `Biz.ExecuteWithPasskeySessionInput` protobuf message.
  /// \return ABI-encoded function call.
  int encodeExecuteWithPasskeySessionCall(int input);
}

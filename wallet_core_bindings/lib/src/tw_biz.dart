part of '../wallet_core_bindings.dart';

/// Biz functions
class TWBiz {
  TWBiz._();

  /// Returns the encoded hash of the user operation
  ///
  /// \param [chainId] The chain ID of the user.
  /// \param [codeAddress] The address of the smart contract wallet.
  /// \param [codeName] The name of the smart contract wallet.
  /// \param [codeVersion] The version of the smart contract wallet.
  /// \param [typeHash] The type hash of the smart contract wallet.
  /// \param [domainSeparatorHash] The domain separator hash of the smart contract wallet.
  /// \param [sender] The sender of the smart contract wallet.
  /// \param [userOpHash] The user operation hash of the smart contract wallet.
  /// \return The encoded hash.
  static Uint8List? getEncodedHash({
    required Uint8List chainId,
    required String codeAddress,
    required String codeName,
    required String codeVersion,
    required String typeHash,
    required String domainSeparatorHash,
    required String sender,
    required String userOpHash,
  }) =>
      TWData.fromPointer(
        _bizImpl.getEncodedHash(
          TWData(chainId).pointer,
          TWString(codeAddress).pointer,
          TWString(codeName).pointer,
          TWString(codeVersion).pointer,
          TWString(typeHash).pointer,
          TWString(domainSeparatorHash).pointer,
          TWString(sender).pointer,
          TWString(userOpHash).pointer,
        ),
      ).bytes();

  /// Signs a message using the private key
  ///
  /// \param [hash] The hash of the user.
  /// \param [privateKey] The private key of the user.
  /// \return The signed hash.
  static Uint8List? getSignedHash({
    required String hash,
    required String privateKey,
  }) =>
      TWData.fromPointer(
        _bizImpl.getSignedHash(
          TWString(hash).pointer,
          TWString(privateKey).pointer,
        ),
      ).bytes();

  /// Encodes `Biz.registerSession` function call to register a session passkey public key.
  ///
  /// \param [sessionPasskeyPublicKey] The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \param [validUntilTimestamp] The timestamp until which the session is valid. Big endian uint64.
  /// \return ABI-encoded function call.
  static Uint8List? encodeRegisterSessionCall({
    required TWPublicKey sessionPasskeyPublicKey,
    required Uint8List validUntilTimestamp,
  }) =>
      TWData.fromPointer(
        _bizImpl.encodeRegisterSessionCall(
          sessionPasskeyPublicKey.pointer,
          TWData(validUntilTimestamp).pointer,
        ),
      ).bytes();

  /// Encodes `Biz.removeSession` function call to deregister a session passkey public key.
  ///
  /// \param [sessionPasskeyPublicKey] The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \return ABI-encoded function call.
  static Uint8List? encodeRemoveSessionCall({
    required TWPublicKey sessionPasskeyPublicKey,
  }) =>
      TWData.fromPointer(
        _bizImpl.encodeRemoveSessionCall(
          sessionPasskeyPublicKey.pointer,
        ),
      ).bytes();

  /// Encodes Biz Passkey Session nonce.
  ///
  /// \param [nonce] The nonce of the Biz Passkey Session account.
  /// \return uint256 represented as [passkey_nonce_key_192, nonce_64].
  static Uint8List? encodePasskeySessionNonce({
    required Uint8List nonce,
  }) =>
      TWData.fromPointer(
        _bizImpl.encodePasskeySessionNonce(
          TWData(nonce).pointer,
        ),
      ).bytes();

  /// Encodes `Biz.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param [input] The serialized data of `Biz.ExecuteWithPasskeySessionInput` protobuf message.
  /// \return ABI-encoded function call.
  static Uint8List? encodeExecuteWithPasskeySessionCall({
    required Uint8List input,
  }) =>
      TWData.fromPointer(
        _bizImpl.encodeExecuteWithPasskeySessionCall(
          TWData(input).pointer,
        ),
      ).bytes();
}

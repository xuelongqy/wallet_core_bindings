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

  /// Signs and encodes `Biz.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param [input] The serialized data of `Biz.ExecuteWithSignatureInput` protobuf message.
  /// \return ABI-encoded function call.
  static Uint8List? signExecuteWithSignatureCall({
    required Uint8List input,
  }) =>
      TWData.fromPointer(
        _bizImpl.signExecuteWithSignatureCall(
          TWData(input).pointer,
        ),
      ).bytes();
}

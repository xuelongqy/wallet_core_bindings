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

  /// Signs and encodes `Biz.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param input The serialized data of `Biz.ExecuteWithSignatureInput` protobuf message.
  /// \return ABI-encoded function call.
  int signExecuteWithSignatureCall(int input);
}

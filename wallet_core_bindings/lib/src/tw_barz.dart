part of '../wallet_core_bindings.dart';

/// Barz functions
class TWBarz {
  TWBarz._();

  /// Calculate a counterfactual address for the smart contract wallet
  ///
  /// \param [input] The serialized data of ContractAddressInput.
  /// \return The address.
  static String getCounterfactualAddress(Uint8List input) =>
      TWString.fromPointer(
              _barzImpl.getCounterfactualAddress(TWData(input).pointer))
          .value!;

  /// Returns the init code parameter of ERC-4337 User Operation
  ///
  /// \param [factory] Wallet factory address (BarzFactory)
  /// \param [publicKey] Public key for the verification facet
  /// \param [verificationFacet] Verification facet address
  /// \return The address.
  static Uint8List getInitCode({
    required String factory,
    required TWPublicKey publicKey,
    required String verificationFacet,
    required int salt,
  }) =>
      TWData.fromPointer(_barzImpl.getInitCode(
        TWString(factory).pointer,
        publicKey.pointer,
        TWString(verificationFacet).pointer,
        salt,
      )).bytes()!;

  /// Converts the original ASN-encoded signature from webauthn to the format accepted by Barz
  ///
  /// \param [signature] Original signature
  /// \param [challenge] The original challenge that was signed
  /// \param [authenticatorData] Returned from Webauthn API
  /// \param [clientDataJSON] Returned from Webauthn API
  /// \return Bytes of the formatted signature
  static Uint8List getFormattedSignature({
    required Uint8List signature,
    required Uint8List challenge,
    required Uint8List authenticatorData,
    required String clientDataJSON,
  }) =>
      TWData.fromPointer(
        _barzImpl.getFormattedSignature(
          TWData(signature).pointer,
          TWData(challenge).pointer,
          TWData(authenticatorData).pointer,
          TWString(clientDataJSON).pointer,
        ),
      ).bytes()!;

  /// Returns the final hash to be signed by Barz for signing messages & typed data
  ///
  /// \param [msgHash] Original msgHash
  /// \param [barzAddress] The address of Barz wallet signing the message
  /// \param [chainId] The chainId of the network the verification will happen
  /// \return The final hash to be signed
  static Uint8List getPrefixedMsgHash({
    required Uint8List msgHash,
    required String barzAddress,
    required int chainId,
  }) =>
      TWData.fromPointer(
        _barzImpl.getPrefixedMsgHash(
          TWData(msgHash).pointer,
          TWString(barzAddress).pointer,
          chainId,
        ),
      ).bytes()!;

  /// Returns the encoded diamondCut function call for Barz contract upgrades
  ///
  /// \param [input] The serialized data of DiamondCutInput
  /// \return The encoded bytes of diamondCut function call
  static Uint8List getDiamondCutCode(Uint8List input) =>
      TWData.fromPointer(_barzImpl.getDiamondCutCode(TWData(input).pointer))
          .bytes()!;

  /// Computes an Authorization hash in [EIP-7702 format](https://eips.ethereum.org/EIPS/eip-7702)
  /// `keccak256('0x05' || rlp([chain_id, address, nonce]))`.
  ///
  /// \param [chainId] The chainId of the network
  /// \param [contractAddress] The address of the contract to be authorized
  /// \param [nonce] The nonce of the transaction
  /// \return The authorization hash
  static Uint8List? getAuthorizationHash({
    required Uint8List chainId,
    required String contractAddress,
    required Uint8List nonce,
  }) =>
      TWData.fromPointer(
        _barzImpl.getAuthorizationHash(
          TWData(chainId).pointer,
          TWString(contractAddress).pointer,
          TWData(nonce).pointer,
        ),
      ).bytes();

  /// Returns the signed authorization hash
  ///
  /// \param [chainId] The chainId of the network
  /// \param [contractAddress] The address of the contract to be authorized
  /// \param [nonce] The nonce of the transaction
  /// \param [privateKey] The private key
  /// \return A json string of the signed authorization
  static String? signAuthorization({
    required Uint8List chainId,
    required String contractAddress,
    required Uint8List nonce,
    required String privateKey,
  }) =>
      TWString.fromPointer(
        _barzImpl.signAuthorization(
          TWData(chainId).pointer,
          TWString(contractAddress).pointer,
          TWData(nonce).pointer,
          TWString(privateKey).pointer,
        ),
      ).value;

  /// Returns the encoded hash of the user operation
  ///
  /// \param [chainId] The chainId of the network
  /// \param [wallet] The address of the wallet
  /// \param [version] The version of the wallet
  /// \param [typeHash] The type hash of the transaction
  /// \param [domainSeparatorHash] The domain separator hash of the wallet
  /// \param [hash] The hash of the user operation
  /// \return The encoded hash of the user operation
  static Uint8List? getEncodedHash({
    required Uint8List chainId,
    required String wallet,
    required String version,
    required String typeHash,
    required String domainSeparatorHash,
    required String hash,
  }) =>
      TWData.fromPointer(
        _barzImpl.getEncodedHash(
          TWData(chainId).pointer,
          TWString(wallet).pointer,
          TWString(version).pointer,
          TWString(typeHash).pointer,
          TWString(domainSeparatorHash).pointer,
          TWString(hash).pointer,
        ),
      ).bytes();

  /// Signs a message using the private key
  ///
  /// \param [hash] The hash to sign
  /// \param [privateKey] The private key
  /// \return The signature
  static Uint8List? getSignedHash({
    required String hash,
    required String privateKey,
  }) =>
      TWData.fromPointer(
        _barzImpl.getSignedHash(
          TWString(hash).pointer,
          TWString(privateKey).pointer,
        ),
      ).bytes();
}

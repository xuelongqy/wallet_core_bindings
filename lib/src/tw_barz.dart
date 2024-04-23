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
              iTWBindings.TWBarzGetCounterfactualAddress(TWData(input).pointer))
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
      TWData.fromPointer(iTWBindings.TWBarzGetInitCode(
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
        iTWBindings.TWBarzGetFormattedSignature(
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
        iTWBindings.TWBarzGetPrefixedMsgHash(
          TWData(msgHash).pointer,
          TWString(barzAddress).pointer,
          chainId,
        ),
      ).bytes()!;

  /// Returns the encoded diamondCut function call for Barz contract upgrades
  ///
  /// \param [input] The serialized data of DiamondCutInput
  /// \return The encoded bytes of diamondCut function call
  static Uint8List getDiamondCutCode(Uint8List input) => TWData.fromPointer(
          iTWBindings.TWBarzGetDiamondCutCode(TWData(input).pointer))
      .bytes()!;
}

part of '../../wallet_core_bindings.dart';

/// [TWBarz] interface.
abstract class TWBarzInterface {
  /// Calculate a counterfactual address for the smart contract wallet
  ///
  /// \param input The serialized data of ContractAddressInput.
  /// \return The address.
  int getCounterfactualAddress(int input);

  /// Returns the final hash to be signed by Barz for signing messages & typed data
  ///
  /// \param msgHash Original msgHash
  /// \param barzAddress The address of Barz wallet signing the message
  /// \param chainId The chainId of the network the verification will happen; Must be non-negative
  /// \return The final hash to be signed.
  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId);

  /// Returns the init code parameter of ERC-4337 User Operation
  ///
  /// \param factory The address of the factory contract
  /// \param publicKey Public key for the verification facet
  /// \param verificationFacet The address of the verification facet
  /// \param salt The salt of the init code; Must be non-negative
  /// \return The init code.
  int getInitCode(int factory, int publicKey, int verificationFacet, int salt);

  /// Converts the original ASN-encoded signature from webauthn to the format accepted by Barz
  ///
  /// \param signature Original signature
  /// \param challenge The original challenge that was signed
  /// \param authenticatorData Returned from Webauthn API
  /// \param clientDataJSON Returned from Webauthn API
  /// \return Bytes of the formatted signature
  int getFormattedSignature(
      int signature, int challenge, int authenticatorData, int clientDataJSON);

  /// Returns the encoded diamondCut function call for Barz contract upgrades
  ///
  /// \param input The serialized data of DiamondCutInput.
  /// \return The diamond cut code.
  int getDiamondCutCode(int input);
}

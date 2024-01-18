part of '../wallet_core_bindings.dart';

/// Barz functions
class TWBarz {
  final Pointer<bindings.TWBarz> _pointer;

  Pointer<bindings.TWBarz> get pointer => _pointer;

  const TWBarz.fromPointer(this._pointer);

  /// Calculate a counterfactual address for the smart contract wallet
  ///
  /// \param [input] The serialized data of ContractAddressInput.
  /// \return The address.
  static String getCounterfactualAddress(TWData input) => TWString.fromPointer(
          iTWBindings.TWBarzGetCounterfactualAddress(input.pointer))
      .toString();

  /// Returns the init code parameter of ERC-4337 User Operation
  ///
  /// \param [factory] Wallet factory address (BarzFactory)
  /// \param [publicKey] Public key for the verification facet
  /// \param [verificationFacet] Verification facet address
  /// \return The address.
  static TWData getInitCode({
    required String factory,
    required TWPublicKey publicKey,
    required String verificationFacet,
    required int salt,
  }) {
    TWString twFactory = TWString(factory);
    TWString twVerificationFacet = TWString(verificationFacet);
    TWData res = TWData.fromPointer(iTWBindings.TWBarzGetInitCode(
        twFactory.pointer,
        publicKey.pointer,
        twVerificationFacet.pointer,
        salt));
    twFactory.delete();
    twVerificationFacet.delete();
    return res;
  }

  /// Converts the original ASN-encoded signature from webauthn to the format accepted by Barz
  ///
  /// \param [signature] Original signature
  /// \param [challenge] The original challenge that was signed
  /// \param [authenticatorData] Returned from Webauthn API
  /// \param [clientDataJSON] Returned from Webauthn API
  /// \return Bytes of the formatted signature
  static TWData getFormattedSignature({
    required TWData signature,
    required TWData challenge,
    required TWData authenticatorData,
    required String clientDataJSON,
  }) {
    TWString twClientDataJSON = TWString(clientDataJSON);
    TWData res = TWData.fromPointer(iTWBindings.TWBarzGetFormattedSignature(
        signature.pointer,
        challenge.pointer,
        authenticatorData.pointer,
        twClientDataJSON.pointer));
    twClientDataJSON.delete();
    return res;
  }
}

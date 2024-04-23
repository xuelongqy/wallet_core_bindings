part of '../wallet_core_bindings.dart';

/// Represents an ASN.1 DER parser.
class TWAsnParser {
  TWAsnParser._();

  /// Parses the given ECDSA signature from ASN.1 DER encoded bytes.
  ///
  /// \param [encoded] The ASN.1 DER encoded signature.
  /// \return The ECDSA signature standard binary representation: RS, where R - 32 byte array, S - 32 byte array.
  static Uint8List? ecdsaSignatureFromDer(TWData encoded) => TWData.fromPointer(
          iTWBindings.TWAsnParserEcdsaSignatureFromDer(encoded.pointer))
      .bytes();
}

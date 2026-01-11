part of '../../../wallet_core_bindings.dart';

/// Decred extension
extension TWDecredExtension on $bitcoin.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Decred `SigningOutput` proto object.
  $decred.SigningOutput signDecred([
    TWCoinType coin = TWCoinType.Decred,
  ]) {
    return anySignToOutput(coin, $decred.SigningOutput());
  }

  /// Compiles a complete transation with one or more external signatures.
  /// \param [coin] coin type.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [pubKeyType] public key type.
  /// \return Decred `SigningOutput` proto object.
  $decred.SigningOutput compileWithSignaturesDecred({
    TWCoinType coin = TWCoinType.Decred,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $decred.SigningOutput(),
    );
  }
}

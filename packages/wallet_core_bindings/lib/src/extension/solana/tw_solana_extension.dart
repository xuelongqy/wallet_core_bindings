part of '../../../wallet_core_bindings.dart';

/// Solana extension
extension TWSolanaExtension on $solana.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Solana `SigningOutput` proto object.
  $solana.SigningOutput sign([
    TWCoinType coin = TWCoinType.Solana,
  ]) {
    return anySignToOutput(coin, $solana.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return Solana `PreSigningOutput` proto object.
  $solana.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Solana,
  ]) {
    return anyPreImageHashesToOutput(
      coin,
      $solana.PreSigningOutput(),
    );
  }

  /// Compiles a complete transation with one or more external signatures.
  /// \param [coin] coin type.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [pubKeyType] public key type.
  /// \return Solana `SigningOutput` proto object.
  $solana.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Solana,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $solana.SigningOutput(),
    );
  }
}

part of '../../../wallet_core_bindings.dart';

/// Everscale extension
extension TWEverscaleExtension on $everscale.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Everscale `SigningOutput` proto object.
  $everscale.SigningOutput sign([
    TWCoinType coin = TWCoinType.Everscale,
  ]) {
    return anySignToOutput(coin, $everscale.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Everscale,
  ]) {
    return anyPreImageHashesToOutput(
      coin,
      $transaction_compiler.PreSigningOutput(),
    );
  }

  /// Compiles a complete transation with one or more external signatures.
  /// \param [coin] coin type.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [pubKeyType] public key type.
  /// \return Everscale `SigningOutput` proto object.
  $everscale.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Everscale,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $everscale.SigningOutput(),
    );
  }
}

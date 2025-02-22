part of '../../../wallet_core_bindings.dart';

/// Algorand extension
extension TWAlgorandExtension on $algorand.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Algorand `SigningOutput` proto object.
  $algorand.SigningOutput sign([
    TWCoinType coin = TWCoinType.Algorand,
  ]) {
    return anySignToOutput(coin, $algorand.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Algorand,
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
  /// \return Algorand `SigningOutput` proto object.
  $algorand.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Algorand,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $algorand.SigningOutput(),
    );
  }
}

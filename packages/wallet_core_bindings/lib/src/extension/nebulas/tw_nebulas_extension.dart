part of '../../../wallet_core_bindings.dart';

/// Nebulas extension
extension TWNebulasExtension on $nebulas.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Nebulas `SigningOutput` proto object.
  $nebulas.SigningOutput sign([
    TWCoinType coin = TWCoinType.Nebulas,
  ]) {
    return anySignToOutput(coin, $nebulas.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Nebulas,
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
  /// \return Nebulas `SigningOutput` proto object.
  $nebulas.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Nebulas,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $nebulas.SigningOutput(),
    );
  }
}

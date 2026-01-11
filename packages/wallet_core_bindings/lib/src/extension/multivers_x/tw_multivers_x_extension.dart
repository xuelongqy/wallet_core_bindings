part of '../../../wallet_core_bindings.dart';

/// MultiversX extension
extension TWMultiversXExtension on $multivers_x.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return MultiversX `SigningOutput` proto object.
  $multivers_x.SigningOutput sign([
    TWCoinType coin = TWCoinType.MultiversX,
  ]) {
    return anySignToOutput(coin, $multivers_x.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.MultiversX,
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
  /// \return MultiversX `SigningOutput` proto object.
  $multivers_x.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.MultiversX,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $multivers_x.SigningOutput(),
    );
  }
}

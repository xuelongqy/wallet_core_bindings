part of '../../../wallet_core_bindings.dart';

/// Waves extension
extension TWWavesExtension on $waves.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Waves `SigningOutput` proto object.
  $waves.SigningOutput sign([
    TWCoinType coin = TWCoinType.Waves,
  ]) {
    return anySignToOutput(coin, $waves.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Waves,
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
  /// \return Waves `SigningOutput` proto object.
  $waves.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Waves,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $waves.SigningOutput(),
    );
  }
}

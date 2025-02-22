part of '../../../wallet_core_bindings.dart';

/// Nervos extension
extension TWNervosExtension on $nervos.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Nervos `SigningOutput` proto object.
  $nervos.SigningOutput sign([
    TWCoinType coin = TWCoinType.Nervos,
  ]) {
    return anySignToOutput(coin, $nervos.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Nervos,
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
  /// \return Nervos `SigningOutput` proto object.
  $nervos.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Nervos,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $nervos.SigningOutput(),
    );
  }
}

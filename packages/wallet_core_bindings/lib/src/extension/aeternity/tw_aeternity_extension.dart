part of '../../../wallet_core_bindings.dart';

/// Aeternity extension
extension TWAeternityExtension on $aeternity.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Aeternity `SigningOutput` proto object.
  $aeternity.SigningOutput sign([
    TWCoinType coin = TWCoinType.Aeternity,
  ]) {
    return anySignToOutput(coin, $aeternity.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Aeternity,
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
  /// \return Aeternity `SigningOutput` proto object.
  $aeternity.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Aeternity,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $aeternity.SigningOutput(),
    );
  }
}

part of '../../../wallet_core_bindings.dart';

/// Zilliqa extension
extension TWZilliqaExtension on $zilliqa.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Zilliqa `SigningOutput` proto object.
  $zilliqa.SigningOutput sign([
    TWCoinType coin = TWCoinType.Zilliqa,
  ]) {
    return anySignToOutput(coin, $zilliqa.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Zilliqa,
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
  /// \return Zilliqa `SigningOutput` proto object.
  $zilliqa.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Zilliqa,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $zilliqa.SigningOutput(),
    );
  }
}

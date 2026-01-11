part of '../../../wallet_core_bindings.dart';

/// Ethereum extension
extension TWBitcoinExtension on $bitcoin.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Bitcoin `SigningOutput` proto object.
  $bitcoin.SigningOutput sign([
    TWCoinType coin = TWCoinType.Bitcoin,
  ]) {
    return anySignToOutput(coin, $bitcoin.SigningOutput());
  }

  /// Plan
  /// \param [coin] coin type
  /// \return [output] Bitcoin `TransactionPlan` proto object.
  $bitcoin.TransactionPlan toPlan([
    TWCoinType coin = TWCoinType.Bitcoin,
  ]) {
    return anyPlanToOutput(coin, $bitcoin.TransactionPlan());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return Bitcoin `PreSigningOutput` proto object.
  $bitcoin.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Bitcoin,
  ]) {
    return anyPreImageHashesToOutput(
      coin,
      $bitcoin.PreSigningOutput(),
    );
  }

  /// Compiles a complete transation with one or more external signatures.
  /// \param [coin] coin type.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [pubKeyType] public key type.
  /// \return Bitcoin `SigningOutput` proto object.
  $bitcoin.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Bitcoin,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $bitcoin.SigningOutput(),
    );
  }
}

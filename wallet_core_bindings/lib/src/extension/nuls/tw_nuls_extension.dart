part of '../../../wallet_core_bindings.dart';

/// NULS extension
extension TWNULSExtension on $nuls.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return NULS `SigningOutput` proto object.
  $nuls.SigningOutput sign([
    TWCoinType coin = TWCoinType.NULS,
  ]) {
    return anySignToOutput(coin, $nuls.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.NULS,
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
  /// \return NULS `SigningOutput` proto object.
  $nuls.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.NULS,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $nuls.SigningOutput(),
    );
  }
}

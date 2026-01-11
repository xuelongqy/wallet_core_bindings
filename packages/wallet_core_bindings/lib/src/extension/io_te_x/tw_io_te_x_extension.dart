part of '../../../wallet_core_bindings.dart';

/// IoTeX extension
extension TWIoTeXExtension on $io_te_x.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return IoTeX `SigningOutput` proto object.
  $io_te_x.SigningOutput sign([
    TWCoinType coin = TWCoinType.IoTeX,
  ]) {
    return anySignToOutput(coin, $io_te_x.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.IoTeX,
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
  /// \return IoTeX `SigningOutput` proto object.
  $io_te_x.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.IoTeX,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $io_te_x.SigningOutput(),
    );
  }
}

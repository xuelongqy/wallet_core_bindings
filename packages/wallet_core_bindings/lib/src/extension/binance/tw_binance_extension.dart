part of '../../../wallet_core_bindings.dart';

/// Binance extension
extension TWBinanceExtension on $binance.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Binance `SigningOutput` proto object.
  $binance.SigningOutput sign([
    TWCoinType coin = TWCoinType.Binance,
  ]) {
    return anySignToOutput(coin, $binance.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Binance,
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
  /// \return Binance `SigningOutput` proto object.
  $binance.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Binance,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $binance.SigningOutput(),
    );
  }
}

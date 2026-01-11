part of '../../../wallet_core_bindings.dart';

/// Ripple extension
extension TWRippleExtension on $ripple.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Ripple `SigningOutput` proto object.
  $ripple.SigningOutput sign([
    TWCoinType coin = TWCoinType.XRP,
  ]) {
    return anySignToOutput(coin, $ripple.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.XRP,
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
  /// \return Ripple `SigningOutput` proto object.
  $ripple.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.XRP,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $ripple.SigningOutput(),
    );
  }
}

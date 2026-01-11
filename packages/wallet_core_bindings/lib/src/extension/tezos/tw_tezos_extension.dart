part of '../../../wallet_core_bindings.dart';

/// Tezos extension
extension TWTezosExtension on $tezos.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Tezos `SigningOutput` proto object.
  $tezos.SigningOutput sign([
    TWCoinType coin = TWCoinType.Tezos,
  ]) {
    return anySignToOutput(coin, $tezos.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Tezos,
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
  /// \return Tezos `SigningOutput` proto object.
  $tezos.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Tezos,
    required List<Uint8List> signatures,
    List<Uint8List> publicKeys = const [],
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $tezos.SigningOutput(),
    );
  }
}

part of '../../../wallet_core_bindings.dart';

/// VeChain extension
extension TWVeChainExtension on $ve_chain.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return VeChain `SigningOutput` proto object.
  $ve_chain.SigningOutput sign([
    TWCoinType coin = TWCoinType.VeChain,
  ]) {
    return anySignToOutput(coin, $ve_chain.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.VeChain,
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
  /// \return VeChain `SigningOutput` proto object.
  $ve_chain.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.VeChain,
    required List<Uint8List> signatures,
    List<Uint8List> publicKeys = const [],
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $ve_chain.SigningOutput(),
    );
  }
}

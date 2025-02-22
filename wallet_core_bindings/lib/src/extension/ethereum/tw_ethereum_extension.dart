part of '../../../wallet_core_bindings.dart';

/// Ethereum extension
extension TWEthereumExtension on $ethereum.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return Ethereum `SigningOutput` proto object.
  $ethereum.SigningOutput sign([
    TWCoinType coin = TWCoinType.Ethereum,
  ]) {
    return anySignToOutput(coin, $ethereum.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.Ethereum,
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
  /// \return Ethereum `SigningOutput` proto object.
  $ethereum.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.Ethereum,
    required List<Uint8List> signatures,
    List<Uint8List> publicKeys = const [],
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $ethereum.SigningOutput(),
    );
  }
}

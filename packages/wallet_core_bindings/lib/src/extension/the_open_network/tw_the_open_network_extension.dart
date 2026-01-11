part of '../../../wallet_core_bindings.dart';

/// TheOpenNetwork extension
extension TWTheOpenNetworkExtension on $the_open_network.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return TheOpenNetwork `SigningOutput` proto object.
  $the_open_network.SigningOutput sign([
    TWCoinType coin = TWCoinType.TON,
  ]) {
    return anySignToOutput(coin, $the_open_network.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.TON,
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
  /// \return TheOpenNetwork `SigningOutput` proto object.
  $the_open_network.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.TON,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $the_open_network.SigningOutput(),
    );
  }
}

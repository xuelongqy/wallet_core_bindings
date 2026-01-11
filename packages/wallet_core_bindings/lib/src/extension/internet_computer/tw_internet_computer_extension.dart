part of '../../../wallet_core_bindings.dart';

/// InternetComputer extension
extension TWInternetComputerExtension on $internet_computer.SigningInput {
  /// Sign
  /// \param [coin] coin type
  /// \return InternetComputer `SigningOutput` proto object.
  $internet_computer.SigningOutput sign([
    TWCoinType coin = TWCoinType.InternetComputer,
  ]) {
    return anySignToOutput(coin, $internet_computer.SigningOutput());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type
  /// \return TransactionCompiler `PreSigningOutput` proto object.
  $transaction_compiler.PreSigningOutput preImageHashes([
    TWCoinType coin = TWCoinType.InternetComputer,
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
  /// \return InternetComputer `SigningOutput` proto object.
  $internet_computer.SigningOutput compileWithSignatures({
    TWCoinType coin = TWCoinType.InternetComputer,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    return anyCompileWithSignaturesToOutput(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
      output: $internet_computer.SigningOutput(),
    );
  }
}

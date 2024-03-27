part of '../wallet_core_bindings.dart';

/// Non-core transaction utility methods, like building a transaction using an external signature.
class TWTransactionCompiler {
  /// Obtains pre-signing hashes of a transaction.
  ///
  /// We provide a default `PreSigningOutput` in TransactionCompiler.proto.
  /// For some special coins, such as bitcoin, we will create a custom `PreSigningOutput` object in its proto file.
  /// \param [coin] coin type.
  /// \param [txInputData] The serialized data of a signing input
  /// \return serialized data of a proto object `PreSigningOutput` includes hash.
  static Uint8List preImageHashes(int coin, Uint8List txInputData) =>
      TWData.fromPointer(iTWBindings.TWTransactionCompilerPreImageHashes(
        coin,
        TWData(txInputData).pointer,
      )).bytes()!;

  /// Compiles a complete transation with one or more external signatures.
  ///
  /// Puts together from transaction input and provided public keys and signatures. The signatures must match the hashes
  /// returned by TWTransactionCompilerPreImageHashes, in the same order. The publicKeyHash attached
  /// to the hashes enable identifying the private key needed for signing the hash.
  /// \param [coin] coin type.
  /// \param [txInputData] The serialized data of a signing input.
  /// \param [signatures] signatures to compile, using TWDataVector.
  /// \param [publicKeys] public keys for signers to match private keys, using TWDataVector.
  /// \return serialized data of a proto object `SigningOutput`.
  static Uint8List compileWithSignatures({
    required int coin,
    required Uint8List txInputData,
    required TWDataVector signatures,
    required TWDataVector publicKeys,
  }) =>
      TWData.fromPointer(iTWBindings.TWTransactionCompilerCompileWithSignatures(
        coin,
        TWData(txInputData).pointer,
        signatures.pointer,
        publicKeys.pointer,
      )).bytes()!;

  /// Compiles a complete transation with one or more external signatures.
  ///
  /// Puts together from transaction input and provided public keys and signatures. The signatures must match the hashes
  /// returned by TWTransactionCompilerPreImageHashes, in the same order. The publicKeyHash attached
  /// to the hashes enable identifying the private key needed for signing the hash.
  /// \param [coin] coin type.
  /// \param [txInputData] The serialized data of a signing input.
  /// \param [signatures] signatures to compile, using TWDataVector.
  /// \param [publicKeys] public keys for signers to match private keys, using TWDataVector.
  /// \return serialized data of a proto object `SigningOutput`.
  static Uint8List compilerCompileWithSignaturesAndPubKeyType({
    required int coin,
    required Uint8List txInputData,
    required TWDataVector signatures,
    required TWDataVector publicKeys,
    required int pubKeyType,
  }) =>
      TWData.fromPointer(
          iTWBindings.TWTransactionCompilerCompileWithSignaturesAndPubKeyType(
        coin,
        TWData(txInputData).pointer,
        signatures.pointer,
        publicKeys.pointer,
        pubKeyType,
      )).bytes()!;
}

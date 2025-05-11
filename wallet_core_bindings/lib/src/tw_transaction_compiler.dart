part of '../wallet_core_bindings.dart';

/// Non-core transaction utility methods, like building a transaction using an external signature.
class TWTransactionCompiler {
  TWTransactionCompiler._();

  /// Obtains pre-signing hashes of a transaction.
  ///
  /// We provide a default `PreSigningOutput` in TransactionCompiler.proto.
  /// For some special coins, such as bitcoin, we will create a custom `PreSigningOutput` object in its proto file.
  /// \param [coin] coin type.
  /// \param [txInputData] The serialized data of a signing input
  /// \return serialized data of a proto object `PreSigningOutput` includes hash.
  static Uint8List preImageHashes(TWCoinType coin, Uint8List txInputData) =>
      TWData.fromPointer(_transactionCompilerImpl.preImageHashes(
        coin.value,
        TWData(txInputData).pointer,
      )).bytes()!;

  /// Compiles a complete transation with one or more external signatures.
  ///
  /// Puts together from transaction input and provided public keys and signatures. The signatures must match the hashes
  /// returned by TWTransactionCompilerPreImageHashes, in the same order. The publicKeyHash attached
  /// to the hashes enable identifying the private key needed for signing the hash.
  /// \param [coin] coin type.
  /// \param [txInputData] The serialized data of a signing input.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \return serialized data of a proto object `SigningOutput`.
  static Uint8List compileWithSignatures({
    required TWCoinType coin,
    required Uint8List txInputData,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
  }) =>
      TWData.fromPointer(_transactionCompilerImpl.compileWithSignatures(
        coin.value,
        TWData(txInputData).pointer,
        TWDataVector.createWithDataList(signatures).pointer,
        TWDataVector.createWithDataList(publicKeys).pointer,
      )).bytes()!;

  /// Compiles a complete transation with one or more external signatures.
  ///
  /// Puts together from transaction input and provided public keys and signatures. The signatures must match the hashes
  /// returned by TWTransactionCompilerPreImageHashes, in the same order. The publicKeyHash attached
  /// to the hashes enable identifying the private key needed for signing the hash.
  /// \param [coin] coin type.
  /// \param [txInputData] The serialized data of a signing input.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [pubKeyType] public key type.
  /// \return serialized data of a proto object `SigningOutput`.
  static Uint8List compileWithSignaturesAndPubKeyType({
    required TWCoinType coin,
    required Uint8List txInputData,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    required TWPublicKeyType pubKeyType,
  }) =>
      TWData.fromPointer(
          _transactionCompilerImpl.compileWithSignaturesAndPubKeyType(
        coin.value,
        TWData(txInputData).pointer,
        TWDataVector.createWithDataList(signatures).pointer,
        TWDataVector.createWithDataList(publicKeys).pointer,
        pubKeyType.value,
      )).bytes()!;
}

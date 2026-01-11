part of '../../wallet_core_bindings.dart';

/// Extensions for obtains pre-signing hashes of a transaction.
extension TWPreImageHashesExtension on GeneratedMessage {
  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type.
  /// \return serialized data of a proto object `PreSigningOutput` includes hash.
  Uint8List anyPreImageHashes(TWCoinType coin) {
    return TWTransactionCompiler.preImageHashes(coin, writeToBuffer());
  }

  /// Obtain pre-signing hashes of a transaction.
  /// \param [coin] coin type.
  /// \param [output] Empty `PreSigningOutput` proto object.
  /// \return [output] after serialization data is filled.
  T anyPreImageHashesToOutput<T extends GeneratedMessage>(
      TWCoinType coin, T output) {
    output.mergeFromBuffer(anyPreImageHashes(coin));
    return output;
  }

  /// Compiles a complete transation with one or more external signatures.
  /// \param [coin] coin type.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [pubKeyType] public key type.
  /// \return serialized data of a proto object `SigningOutput`.
  Uint8List anyCompileWithSignatures({
    required TWCoinType coin,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
  }) {
    if (pubKeyType != null) {
      return TWTransactionCompiler.compileWithSignaturesAndPubKeyType(
        coin: coin,
        txInputData: writeToBuffer(),
        signatures: signatures,
        publicKeys: publicKeys,
        pubKeyType: pubKeyType,
      );
    }
    return TWTransactionCompiler.compileWithSignatures(
      coin: coin,
      txInputData: writeToBuffer(),
      signatures: signatures,
      publicKeys: publicKeys,
    );
  }

  /// Compiles a complete transation with one or more external signatures.
  /// \param [coin] coin type.
  /// \param [signatures] signatures to compile.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [publicKeys] public keys for signers to match private keys.
  /// \param [pubKeyType] public key type.
  /// \param [output] Empty `SigningOutput` proto object.
  /// \return [output] after serialization data is filled.
  T anyCompileWithSignaturesToOutput<T extends GeneratedMessage>({
    required TWCoinType coin,
    required List<Uint8List> signatures,
    required List<Uint8List> publicKeys,
    TWPublicKeyType? pubKeyType,
    required T output,
  }) {
    output.mergeFromBuffer(anyCompileWithSignatures(
      coin: coin,
      signatures: signatures,
      publicKeys: publicKeys,
      pubKeyType: pubKeyType,
    ));
    return output;
  }
}

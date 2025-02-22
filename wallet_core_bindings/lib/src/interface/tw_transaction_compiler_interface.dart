part of '../../wallet_core_bindings.dart';

/// [TWTransactionCompiler] interface.
abstract class TWTransactionCompilerInterface {
  int preImageHashes(int coin, int txInputData);

  int compileWithSignatures(
      int coin, int txInputData, int signatures, int publicKeys);

  int compileWithSignaturesAndPubKeyType(int coin, int txInputData,
      int signatures, int publicKeys, int pubKeyType);
}

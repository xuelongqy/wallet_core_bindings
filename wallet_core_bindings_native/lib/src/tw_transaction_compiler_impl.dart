part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWTransactionCompiler].
class TWTransactionCompilerImpl extends TWTransactionCompilerInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWTransactionCompilerImpl(this.bindings);

  @override
  int compileWithSignatures(
      int coin, int txInputData, int signatures, int publicKeys) {
    return bindings.TWTransactionCompilerCompileWithSignatures(
      coin,
      Pointer.fromAddress(txInputData),
      Pointer.fromAddress(signatures),
      Pointer.fromAddress(publicKeys),
    ).address;
  }

  @override
  int compilerCompileWithSignaturesAndPubKeyType(int coin, int txInputData,
      int signatures, int publicKeys, int pubKeyType) {
    return bindings.TWTransactionCompilerCompileWithSignaturesAndPubKeyType(
      coin,
      Pointer.fromAddress(txInputData),
      Pointer.fromAddress(signatures),
      Pointer.fromAddress(publicKeys),
      pubKeyType,
    ).address;
  }

  @override
  int preImageHashes(int coin, int txInputData) {
    return bindings.TWTransactionCompilerPreImageHashes(
      coin,
      Pointer.fromAddress(txInputData),
    ).address;
  }
}

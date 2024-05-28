part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTransactionCompiler].
class TWTransactionCompilerImpl extends TWTransactionCompilerInterface {
  final WasmInstance wasm;

  TWTransactionCompilerImpl(this.wasm);

  @override
  int compileWithSignatures(
      int coin, int txInputData, int signatures, int publicKeys) {
    final func =
        wasm.getFunction('TWTransactionCompilerCompileWithSignatures')!;
    return func([coin, txInputData, signatures, publicKeys]).first as int;
  }

  @override
  int compilerCompileWithSignaturesAndPubKeyType(int coin, int txInputData,
      int signatures, int publicKeys, int pubKeyType) {
    final func = wasm.getFunction(
        'TWTransactionCompilerCompileWithSignaturesAndPubKeyType')!;
    return func([coin, txInputData, signatures, publicKeys, pubKeyType]).first
        as int;
  }

  @override
  int preImageHashes(int coin, int txInputData) {
    final func = wasm.getFunction('TWTransactionCompilerPreImageHashes')!;
    return func([coin, txInputData]).first as int;
  }
}

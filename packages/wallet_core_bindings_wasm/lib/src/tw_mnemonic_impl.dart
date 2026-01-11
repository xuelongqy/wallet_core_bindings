part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWMnemonic].
class TWMnemonicImpl extends TWMnemonicInterface {
  final WasmInstance wasm;

  TWMnemonicImpl(this.wasm);

  @override
  bool isValid(int mnemonic) {
    final func = wasm.getFunction('TWMnemonicIsValid')!;
    return func([mnemonic]).first as int != 0;
  }

  @override
  bool isValidWord(int word) {
    final func = wasm.getFunction('TWMnemonicIsValidWord')!;
    return func([word]).first as int != 0;
  }

  @override
  int suggest(int word) {
    final func = wasm.getFunction('TWMnemonicSuggest')!;
    return func([word]).first as int;
  }
}

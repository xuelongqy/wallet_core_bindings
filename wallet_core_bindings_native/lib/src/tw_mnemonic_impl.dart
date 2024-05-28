part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWMnemonic].
class TWMnemonicImpl extends TWMnemonicInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWMnemonicImpl(this.bindings);

  @override
  bool isValid(int mnemonic) {
    return bindings.TWMnemonicIsValid(
      Pointer.fromAddress(mnemonic),
    );
  }

  @override
  bool isValidWord(int word) {
    return bindings.TWMnemonicIsValidWord(
      Pointer.fromAddress(word),
    );
  }

  @override
  int suggest(int word) {
    return bindings.TWMnemonicSuggest(
      Pointer.fromAddress(word),
    ).address;
  }
}
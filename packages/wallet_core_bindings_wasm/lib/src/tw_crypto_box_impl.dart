part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWCryptoBox].
class TWCryptoBoxImpl extends TWCryptoBoxInterface {
  final WasmInstance wasm;

  TWCryptoBoxImpl(this.wasm);

  @override
  int decryptEasy(int mySecret, int otherPubkey, int encrypted) {
    final func = wasm.getFunction('TWCryptoBoxDecryptEasy')!;
    return func([mySecret, otherPubkey, encrypted]).first as int;
  }

  @override
  int encryptEasy(int mySecret, int otherPubkey, int message) {
    final func = wasm.getFunction('TWCryptoBoxEncryptEasy')!;
    return func([mySecret, otherPubkey, message]).first as int;
  }
}

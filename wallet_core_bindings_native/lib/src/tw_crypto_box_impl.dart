part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWCryptoBox].
class TWCryptoBoxImpl extends TWCryptoBoxInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWCryptoBoxImpl(this.bindings);

  @override
  int decryptEasy(int mySecret, int otherPubkey, int encrypted) {
    return bindings.TWCryptoBoxDecryptEasy(
      Pointer.fromAddress(mySecret),
      Pointer.fromAddress(otherPubkey),
      Pointer.fromAddress(encrypted),
    ).address;
  }

  @override
  int encryptEasy(int mySecret, int otherPubkey, int message) {
    return bindings.TWCryptoBoxEncryptEasy(
      Pointer.fromAddress(mySecret),
      Pointer.fromAddress(otherPubkey),
      Pointer.fromAddress(message),
    ).address;
  }
}

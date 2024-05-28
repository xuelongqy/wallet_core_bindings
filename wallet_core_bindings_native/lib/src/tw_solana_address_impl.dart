part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWSolanaAddress].
class TWSolanaAddressImpl extends TWSolanaAddressInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWSolanaAddressImpl(this.bindings);

  @override
  int createWithString(int string) {
    return bindings.TWSolanaAddressCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int defaultTokenAddress(int pointer, int tokenMintAddress) {
    return bindings.TWSolanaAddressDefaultTokenAddress(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(tokenMintAddress),
    ).address;
  }

  @override
  void delete(int pointer) {
    return bindings.TWSolanaAddressDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWSolanaAddressDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }
}

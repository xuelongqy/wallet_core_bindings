part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWBech32].
class TWBech32Impl extends TWBech32Interface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBech32Impl(this.bindings);

  @override
  int decode(int string) {
    return bindings.TWBech32Decode(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int decodeM(int string) {
    return bindings.TWBech32DecodeM(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int encode(int hrp, int data) {
    return bindings.TWBech32Encode(
      Pointer.fromAddress(hrp),
      Pointer.fromAddress(data),
    ).address;
  }

  @override
  int encodeM(int hrp, int data) {
    return bindings.TWBech32EncodeM(
      Pointer.fromAddress(hrp),
      Pointer.fromAddress(data),
    ).address;
  }
}

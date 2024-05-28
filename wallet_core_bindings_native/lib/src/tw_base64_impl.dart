part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBase64].
class TWBase64Impl extends TWBase64Interface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBase64Impl(this.bindings);

  @override
  int decode(int string) {
    return bindings.TWBase64Decode(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int decodeUrl(int string) {
    return bindings.TWBase64DecodeUrl(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int encode(int data) {
    return bindings.TWBase64Encode(
      Pointer.fromAddress(data),
    ).address;
  }

  @override
  int encodeUrl(int data) {
    return bindings.TWBase64EncodeUrl(
      Pointer.fromAddress(data),
    ).address;
  }
}

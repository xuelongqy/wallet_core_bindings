part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBase32].
class TWBase32Impl extends TWBase32Interface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBase32Impl(this.bindings);

  @override
  int decode(int string) {
    return bindings.TWBase32Decode(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int decodeWithAlphabet(int string, int alphabet) {
    return bindings.TWBase32DecodeWithAlphabet(
      Pointer.fromAddress(string),
      Pointer.fromAddress(alphabet),
    ).address;
  }

  @override
  int encode(int data) {
    return bindings.TWBase32Encode(
      Pointer.fromAddress(data),
    ).address;
  }

  @override
  int encodeWithAlphabet(int data, int alphabet) {
    return bindings.TWBase32EncodeWithAlphabet(
      Pointer.fromAddress(data),
      Pointer.fromAddress(alphabet),
    ).address;
  }
}

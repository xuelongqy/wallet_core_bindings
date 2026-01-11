part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBase58].
class TWBase58Impl extends TWBase58Interface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBase58Impl(this.bindings);

  @override
  int decode(int string) {
    return bindings.TWBase58Decode(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int decodeNoCheck(int string) {
    return bindings.TWBase58DecodeNoCheck(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  int encode(int data) {
    return bindings.TWBase58Encode(
      Pointer.fromAddress(data),
    ).address;
  }

  @override
  int encodeNoCheck(int data) {
    return bindings.TWBase58EncodeNoCheck(
      Pointer.fromAddress(data),
    ).address;
  }
}

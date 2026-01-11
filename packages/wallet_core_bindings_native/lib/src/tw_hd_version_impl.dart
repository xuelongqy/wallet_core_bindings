part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWHDVersion].
class TWHDVersionImpl extends TWHDVersionInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWHDVersionImpl(this.bindings);

  @override
  bool isPrivate(int version) {
    return bindings.TWHDVersionIsPrivate(version);
  }

  @override
  bool isPublic(int version) {
    return bindings.TWHDVersionIsPublic(version);
  }
}

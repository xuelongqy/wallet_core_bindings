part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWHRP].
class TWHRPImpl extends TWHRPInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWHRPImpl(this.bindings);

  @override
  String? stringForHRP(int hrp) {
    final nativeString = bindings.stringForHRP(hrp);
    if (nativeString == nullptr) {
      return null;
    }
    return nativeString.cast<Utf8>().toDartString();
  }

  @override
  int hrpForString(String string) {
    final strPointer = string.toNativeUtf8();
    final hrp = bindings.hrpForString(strPointer.cast());
    malloc.free(strPointer);
    return hrp;
  }
}

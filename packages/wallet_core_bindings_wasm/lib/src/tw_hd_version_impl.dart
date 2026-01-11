part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWHDVersion].
class TWHDVersionImpl extends TWHDVersionInterface {
  final WasmInstance wasm;

  TWHDVersionImpl(this.wasm);

  @override
  bool isPrivate(int version) {
    final func = wasm.getFunction('TWHDVersionIsPrivate')!;
    return func([version]).first as int == 1;
  }

  @override
  bool isPublic(int version) {
    final func = wasm.getFunction('TWHDVersionIsPublic')!;
    return func([version]).first as int == 1;
  }
}

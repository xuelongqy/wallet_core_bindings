part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWDataVector].
class TWDataVectorImpl extends TWDataVectorInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWDataVectorImpl(this.bindings);

  @override
  void add(int pointer, int data) {
    bindings.TWDataVectorAdd(
      Pointer.fromAddress(pointer),
      Pointer.fromAddress(data),
    );
  }

  @override
  int create() {
    return bindings.TWDataVectorCreate().address;
  }

  @override
  int createWithData(int data) {
    return bindings.TWDataVectorCreateWithData(
      Pointer.fromAddress(data),
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWDataVectorDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int get(int pointer, int index) {
    return bindings.TWDataVectorGet(
      Pointer.fromAddress(pointer),
      index,
    ).address;
  }

  @override
  int size(int pointer) {
    return bindings.TWDataVectorSize(
      Pointer.fromAddress(pointer),
    );
  }
}

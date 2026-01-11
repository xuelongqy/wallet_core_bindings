part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWDerivationPath].
class TWDerivationPathImpl extends TWDerivationPathInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWDerivationPathImpl(this.bindings);

  @override
  int account(int pointer) {
    return bindings.TWDerivationPathAccount(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int address(int pointer) {
    return bindings.TWDerivationPathAddress(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int change(int pointer) {
    return bindings.TWDerivationPathChange(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int coin(int pointer) {
    return bindings.TWDerivationPathCoin(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int create(int purpose, int coin, int account, int change, int address) {
    return bindings.TWDerivationPathCreate(
      purpose,
      coin,
      account,
      change,
      address,
    ).address;
  }

  @override
  int createWithString(int string) {
    return bindings.TWDerivationPathCreateWithString(
      Pointer.fromAddress(string),
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWDerivationPathDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int description(int pointer) {
    return bindings.TWDerivationPathDescription(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int indexAt(int pointer, int index) {
    return bindings.TWDerivationPathIndexAt(
      Pointer.fromAddress(pointer),
      index,
    ).address;
  }

  @override
  int indicesCount(int pointer) {
    return bindings.TWDerivationPathIndicesCount(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int purpose(int pointer) {
    return bindings.TWDerivationPathPurpose(
      Pointer.fromAddress(pointer),
    );
  }
}

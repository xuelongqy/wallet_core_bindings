part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWMessageSigner].
class TWMessageSignerImpl extends TWMessageSignerInterface {
  final WasmInstance wasm;

  TWMessageSignerImpl(this.wasm);

  @override
  int sign(int coin, int input) {
    final func = wasm.getFunction('TWMessageSignerSign')!;
    return (func([coin, input]).first as int);
  }

  @override
  bool verify(int coin, int input) {
    final func = wasm.getFunction('TWMessageSignerVerify')!;
    return (func([coin, input]).first as int) != 0;
  }
}

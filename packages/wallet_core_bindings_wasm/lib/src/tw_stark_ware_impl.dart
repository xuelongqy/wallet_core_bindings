part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWStarkWare].
class TWStarkWareImpl extends TWStarkWareInterface {
  final WasmInstance wasm;

  TWStarkWareImpl(this.wasm);

  @override
  int getStarkKeyFromSignature(int derivationPath, int signature) {
    final func = wasm.getFunction('TWStarkWareGetStarkKeyFromSignature')!;
    return func([derivationPath, signature]).first as int;
  }
}

part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTONMessageSigner].
class TWTONMessageSignerImpl extends TWTONMessageSignerInterface {
  final WasmInstance wasm;

  TWTONMessageSignerImpl(this.wasm);

  @override
  int signMessage(int privateKey, int message) {
    final func = wasm.getFunction('TWTONMessageSignerSignMessage')!;
    return func([privateKey, message]).first as int;
  }
}

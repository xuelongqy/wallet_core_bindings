part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTronMessageSigner].
class TWTronMessageSignerImpl extends TWTronMessageSignerInterface {
  final WasmInstance wasm;

  TWTronMessageSignerImpl(this.wasm);

  @override
  int signMessage(int privateKey, int message) {
    final func = wasm.getFunction('TWTronMessageSignerSignMessage')!;
    return func([privateKey, message]).first as int;
  }

  @override
  bool verifyMessage(int pubKey, int message, int signature) {
    final func = wasm.getFunction('TWTronMessageSignerVerifyMessage')!;
    return (func([pubKey, message, signature]).first as int) != 0;
  }
}

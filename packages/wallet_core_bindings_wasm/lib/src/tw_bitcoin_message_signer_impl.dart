part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWBitcoinMessageSigner].
class TWBitcoinMessageSignerImpl extends TWBitcoinMessageSignerInterface {
  final WasmInstance wasm;

  TWBitcoinMessageSignerImpl(this.wasm);

  @override
  int signMessage(int privateKey, int address, int message) {
    final func = wasm.getFunction('TWBitcoinMessageSignerSignMessage')!;
    return func([privateKey, address, message]).first as int;
  }

  @override
  bool verifyMessage(int address, int message, int signature) {
    final func = wasm.getFunction('TWBitcoinMessageSignerVerifyMessage')!;
    return (func([address, message, signature]).first as int) != 0;
  }
}

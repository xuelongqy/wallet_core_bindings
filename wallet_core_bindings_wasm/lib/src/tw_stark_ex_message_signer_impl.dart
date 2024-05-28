part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWStarkExMessageSigner].
class TWStarkExMessageSignerImpl extends TWStarkExMessageSignerInterface {
  final WasmInstance wasm;

  TWStarkExMessageSignerImpl(this.wasm);

  @override
  int signMessage(int privateKey, int message) {
    final func = wasm.getFunction('TWStarkExMessageSignerSignMessage')!;
    return func([privateKey, message]).first as int;
  }

  @override
  bool verifyMessage(int publicKey, int message, int signature) {
    final func = wasm.getFunction('TWStarkExMessageSignerVerifyMessage')!;
    return (func([publicKey, message, signature]).first as int) != 0;
  }
}

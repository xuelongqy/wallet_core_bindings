part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTezosMessageSigner].
class TWTezosMessageSignerImpl extends TWTezosMessageSignerInterface {
  final WasmInstance wasm;

  TWTezosMessageSignerImpl(this.wasm);

  @override
  int formatMessage(int message, int url) {
    final func = wasm.getFunction('TWTezosMessageSignerFormatMessage')!;
    return func([message, url]).first as int;
  }

  @override
  int inputToPayload(int message) {
    final func = wasm.getFunction('TWTezosMessageSignerInputToPayload')!;
    return func([message]).first as int;
  }

  @override
  int signMessage(int privateKey, int message) {
    final func = wasm.getFunction('TWTezosMessageSignerSignMessage')!;
    return func([privateKey, message]).first as int;
  }

  @override
  bool verifyMessage(int pubKey, int message, int signature) {
    final func = wasm.getFunction('TWTezosMessageSignerVerifyMessage')!;
    return (func([pubKey, message, signature]).first as int) != 0;
  }
}

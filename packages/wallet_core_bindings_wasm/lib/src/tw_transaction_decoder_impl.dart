part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTransactionDecoder].
class TWTransactionDecoderImpl extends TWTransactionDecoderInterface {
  final WasmInstance wasm;

  TWTransactionDecoderImpl(this.wasm);

  @override
  int decode(int coin, int encodedTx) {
    final func = wasm.getFunction('TWTransactionDecoderDecode')!;
    return func([coin, encodedTx]).first as int;
  }
}

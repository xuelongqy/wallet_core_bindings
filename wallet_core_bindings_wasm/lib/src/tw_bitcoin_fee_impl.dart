part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWBitcoinFee].
class TWBitcoinFeeImpl extends TWBitcoinFeeInterface {
  final WasmInstance wasm;

  TWBitcoinFeeImpl(this.wasm);

  @override
  int calculateFee(int data, int satVb) {
    final func = wasm.getFunction('TWBitcoinFeeCalculateFee')!;
    return func([data, satVb]).first as int;
  }
}

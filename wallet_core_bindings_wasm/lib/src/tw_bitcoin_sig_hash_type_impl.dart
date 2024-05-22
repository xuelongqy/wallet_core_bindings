part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWBitcoinSigHashType].
class TWBitcoinSigHashTypeImpl extends TWBitcoinSigHashTypeInterface {
  final WasmInstance wasm;

  TWBitcoinSigHashTypeImpl(this.wasm);

  @override
  bool isNone(int type) {
    final func = wasm.getFunction('TWBitcoinSigHashTypeIsNone')!;
    return func([type]).first as int == 1;
  }

  @override
  bool isSingle(int type) {
    final func = wasm.getFunction('TWBitcoinSigHashTypeIsSingle')!;
    return func([type]).first as int == 1;
  }
}

part of '../../wallet_core_bindings_wasm.dart';

/// Extension for [WasmInstance].
extension WasmInstanceExtension on WasmInstance {

  /// Allocate memory in the Wasm instance.
  int malloc(int size) {
    final func = getFunction('malloc')!;
    return func([size]).first as int;
  }

  /// Free memory in the Wasm instance.
  void free(int offset) {
    final func = getFunction('free')!;
    func([offset]);
  }
}
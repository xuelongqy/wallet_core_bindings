part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWHRP].
class TWHRPImpl extends TWHRPInterface {
  final WasmInstance wasm;

  TWHRPImpl(this.wasm);

  @override
  String? stringForHRP(int hrp) {
    final func = wasm.getFunction('stringForHRP')!;
    final memory = wasm.getMemory('memory')!;
    final strPointer = func([hrp]).first as int;
    if (strPointer == 0) {
      return null;
    }
    return memory.getString(strPointer);
  }

  @override
  int hrpForString(String string) {
    final func = wasm.getFunction('hrpForString')!;
    final strPointer = TWString(string).utf8Bytes();
    return func([strPointer]).first as int;
  }
}

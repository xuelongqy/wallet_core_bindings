part of '../../wallet_core_bindings_wasm.dart';

/// Extension for [WasmMemory].
extension WasmMemoryExtension on WasmMemory {
  /// Get a string from memory.
  String getDartString(int offset, [int? length]) {
    var len = length;
    if (len == null) {
      len = 0;
      while (view[offset + len!] != 0) {
        len++;
      }
    }
    final bytes = view.sublist(offset, offset + len);
    return utf8.decode(bytes);
  }
}

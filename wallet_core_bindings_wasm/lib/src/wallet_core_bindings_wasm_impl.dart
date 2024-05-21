part of '../wallet_core_bindings_wasm.dart';

/// WalletCore bindings wasm implementation.
/// Use WalletCore wasm. See [https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building#wasm-building].
class WalletCoreBindingsWasmImpl extends WalletCoreBindingsInterface {
  /// Wasm instance.
  late WasmInstance _wasm;

  /// Wasm bytes.
  Uint8List? _wasmBytes;

  /// Creates a new WalletCore bindings wasm implementation.
  /// [wasmBytes] is the wallet-core.wasm bytes.
  WalletCoreBindingsWasmImpl([Uint8List? wasmBytes]) : _wasmBytes = wasmBytes;

  @override
  Future initialize() async {
    var wasmBytes = _wasmBytes;
    wasmBytes ??= (await rootBundle.load(
            'packages/wallet_core_bindings_wasm/assets/wasm/wallet-core.wasm'))
        .buffer
        .asUint8List();
    final module = await compileWasmModule(
      wasmBytes.buffer.asUint8List(),
      config: const ModuleConfig(
        wasmi: ModuleConfigWasmi(),
        wasmtime: ModuleConfigWasmtime(),
      ),
    );
    if (_wasmBytes != null) {
      _wasmBytes = null;
    }
    final builder = module.builder();
    builder.addImports([
      WasmImport(
        "wasi_snapshot_preview1",
        "clock_time_get",
        WasmFunction(
          (int id, I64 precision, int ptr_time) {
            BigInt nanosecondsSinceEpoch =
                BigInt.from(DateTime.now().microsecondsSinceEpoch) *
                    BigInt.from(1000);
            _wasm.getMemory('memory')!.view.setAll(
                ptr_time, hex.decode(nanosecondsSinceEpoch.toRadixString(16)));
            return 0;
          },
          params: const [ValueTy.i32, ValueTy.i64, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "wasi_snapshot_preview1",
        "proc_exit",
        WasmFunction(
          (int code) => throw Exception("Process exited with code $code"),
          params: const [ValueTy.i32],
          results: const [],
        ),
      ),
      WasmImport(
        "wasi_snapshot_preview1",
        "environ_sizes_get",
        WasmFunction(
          (int len, int buflen) => 0,
          params: const [ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "wasi_snapshot_preview1",
        "environ_get",
        WasmFunction(
          (int environ, int environ_buf) => 0,
          params: const [ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "wasi_snapshot_preview1",
        "fd_close",
        WasmFunction(
          (int fd) => 0,
          params: const [ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "env",
        "__syscall_getcwd",
        WasmFunction(
          (int code) => 0,
          params: const [ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "wasi_snapshot_preview1",
        "fd_seek",
        WasmFunction(
          (int fd, I64 offset, int whence, int newOffset) => 0,
          params: const [ValueTy.i32, ValueTy.i64, ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "wasi_snapshot_preview1",
        "fd_read",
        WasmFunction(
          (int fd, int iovs, int iovslen, int size) => 0,
          params: const [ValueTy.i32, ValueTy.i32, ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "wasi_snapshot_preview1",
        "fd_write",
        WasmFunction(
          (int fd, int iovs, int iovslen, int size) => 0,
          params: const [ValueTy.i32, ValueTy.i32, ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
    ]);
    _wasm = await builder.build();
    string = TwStringImpl(_wasm);
    data = TwDataImpl(_wasm);
    WalletCoreBindingsInterface.instance = this;
  }
}

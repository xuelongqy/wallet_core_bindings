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
    final builder = module.builder(
      wasiConfig: WasiConfig(
        preopenedDirs: [],
        webBrowserFileSystem: {},
      ),
    );
    builder.addImports([
      WasmImport(
        "env",
        "__syscall_getcwd",
        WasmFunction(
          (int code) {
            print('__syscall_getcwd');
            return 0;
          },
          params: const [ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
    ]);
    _wasm = await builder.build();
    bitcoinSigHashType = TWBitcoinSigHashTypeImpl(_wasm);
    coinType = TWCoinTypeImpl(_wasm);
    data = TWDataImpl(_wasm);
    hash = TWHashImpl(_wasm);
    hdVersion = TWHDVersionImpl(_wasm);
    hrp = TWHRPImpl(_wasm);
    privateKey = TWPrivateKeyImpl(_wasm);
    publicKey = TWPublicKeyImpl(_wasm);
    string = TWStringImpl(_wasm);
    WalletCoreBindingsInterface.instance = this;
  }
}

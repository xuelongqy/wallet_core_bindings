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
          (int param, int param2) {
            print('__syscall_getcwd');
            return 0;
          },
          params: const [ValueTy.i32, ValueTy.i32],
          results: const [ValueTy.i32],
        ),
      ),
      WasmImport(
        "env",
        "emscripten_notify_memory_growth",
        WasmFunction(
          (int code) {
            log('emscripten_notify_memory_growth');
          },
          params: const [ValueTy.i32],
          results: const [],
        ),
      ),
    ]);
    _wasm = await builder.build();
    account = TWAccountImpl(_wasm);
    aes = TWAESImpl(_wasm);
    anyAddress = TWAnyAddressImpl(_wasm);
    anySigner = TWAnySignerImpl(_wasm);
    asnParser = TWASNParserImpl(_wasm);
    barz = TWBarzImpl(_wasm);
    base32 = TWBase32Impl(_wasm);
    base58 = TWBase58Impl(_wasm);
    this.base64 = TWBase64Impl(_wasm);
    bitcoinAddress = TWBitcoinAddressImpl(_wasm);
    bitcoinFee = TWBitcoinFeeImpl(_wasm);
    bitcoinMessageSigner = TWBitcoinMessageSignerImpl(_wasm);
    bitcoinScript = TWBitcoinScriptImpl(_wasm);
    bitcoinSigHashType = TWBitcoinSigHashTypeImpl(_wasm);
    cardano = TWCardanoImpl(_wasm);
    coinType = TWCoinTypeImpl(_wasm);
    coinTypeConfiguration = TWCoinTypeConfigurationImpl(_wasm);
    data = TWDataImpl(_wasm);
    dataVector = TWDataVectorImpl(_wasm);
    derivationPath = TWDerivationPathImpl(_wasm);
    derivationPathIndex = TWDerivationPathIndexImpl(_wasm);
    ethereumAbiFunction = TWEthereumAbiFunctionImpl(_wasm);
    ethereumAbi = TWEthereumAbiImpl(_wasm);
    ethereumAbiValue = TWEthereumAbiValueImpl(_wasm);
    ethereum = TWEthereumImpl(_wasm);
    ethereumMessageSigner = TWEthereumMessageSignerImpl(_wasm);
    ethereumRlp = TWEthereumRlpImpl(_wasm);
    filecoinAddressConverter = TWFilecoinAddressConverterImpl(_wasm);
    fioAccount = TWFIOAccountImpl(_wasm);
    groestlcoinAddress = TWGroestlcoinAddressImpl(_wasm);
    hash = TWHashImpl(_wasm);
    hdVersion = TWHDVersionImpl(_wasm);
    hdWallet = TWHDWalletImpl(_wasm);
    hrp = TWHRPImpl(_wasm);
    liquidStaking = TWLiquidStakingImpl(_wasm);
    mnemonic = TWMnemonicImpl(_wasm);
    nearAccount = TWNEARAccountImpl(_wasm);
    nervosAddress = TWNervosAddressImpl(_wasm);
    pbkdf2 = TWPBKDF2Impl(_wasm);
    privateKey = TWPrivateKeyImpl(_wasm);
    publicKey = TWPublicKeyImpl(_wasm);
    rippleXAddress = TWRippleXAddressImpl(_wasm);
    segwitAddress = TWSegwitAddressImpl(_wasm);
    solanaAddress = TWSolanaAddressImpl(_wasm);
    solanaTransaction = TWSolanaTransactionImpl(_wasm);
    starkExMessageSigner = TWStarkExMessageSignerImpl(_wasm);
    starkWare = TWStarkWareImpl(_wasm);
    storedKey = TWStoredKeyImpl(_wasm);
    string = TWStringImpl(_wasm);
    tezosMessageSigner = TWTezosMessageSignerImpl(_wasm);
    thorChainSwap = TWTHORChainSwapImpl(_wasm);
    tonAddressConverter = TWTONAddressConverterImpl(_wasm);
    transactionCompiler = TWTransactionCompilerImpl(_wasm);
    transactionDecoder = TWTransactionDecoderImpl(_wasm);
    tronMessageSigner = TWTronMessageSignerImpl(_wasm);
    walletConnectRequest = TWWalletConnectRequestImpl(_wasm);
    webAuthn = TWWebAuthnImpl(_wasm);
    WalletCoreBindingsInterface.instance = this;
  }
}

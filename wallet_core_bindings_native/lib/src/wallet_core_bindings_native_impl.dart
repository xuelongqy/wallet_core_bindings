part of '../wallet_core_bindings_native.dart';

/// WalletCore bindings native implementation.
/// Use WalletCore dynamic library. See [https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building].
class WalletCoreBindingsNativeImpl extends WalletCoreBindingsInterface {
  /// Default TrustWalletCore library.
  static final _defaultWalletCoreLibrary = Platform.isWindows
      ? DynamicLibrary.open('libTrustWalletCore.dll')
      : Platform.isMacOS
          ? DynamicLibrary.open('libTrustWalletCore.dylib')
          : Platform.isIOS
              ? DynamicLibrary.open('WalletCore.xcframework')
              : DynamicLibrary.open('libTrustWalletCore.so');

  /// Default TrustWalletCore bindings.
  static final _defaultBindings =
      native_bindings.TrustWalletCoreBindings(_defaultWalletCoreLibrary);

  /// TrustWalletCore bindings.
  final native_bindings.TrustWalletCoreBindings _bindings;

  WalletCoreBindingsNativeImpl._(this._bindings);

  /// Creates a new WalletCore bindings native implementation.
  /// [bindings] is the TrustWalletCore dynamic library bindings.
  factory WalletCoreBindingsNativeImpl(
      [native_bindings.TrustWalletCoreBindings? bindings]) {
    return WalletCoreBindingsNativeImpl._(bindings ?? _defaultBindings);
  }

  @override
  Future initialize() async {
    account = TWAccountImpl(_bindings);
    aes = TWAESImpl(_bindings);
    anyAddress = TWAnyAddressImpl(_bindings);
    anySigner = TWAnySignerImpl(_bindings);
    asnParser = TWASNParserImpl(_bindings);
    barz = TWBarzImpl(_bindings);
    base32 = TWBase32Impl(_bindings);
    base58 = TWBase58Impl(_bindings);
    base64 = TWBase64Impl(_bindings);
    bitcoinAddress = TWBitcoinAddressImpl(_bindings);
    bitcoinMessageSigner = TWBitcoinMessageSignerImpl(_bindings);
    bitcoinScript = TWBitcoinScriptImpl(_bindings);
    bitcoinSigHashType = TWBitcoinSigHashTypeImpl(_bindings);
    cardano = TWCardanoImpl(_bindings);
    coinTypeConfiguration = TWCoinTypeConfigurationImpl(_bindings);
    coinType = TWCoinTypeImpl(_bindings);
    cryptoBox = TWCryptoBoxImpl(_bindings);
    cryptoBoxPublicKey = TWCryptoBoxPublicKeyImpl(_bindings);
    cryptoBoxSecretKey = TWCryptoBoxSecretKeyImpl(_bindings);
    data = TWDataImpl(_bindings);
    dataVector = TWDataVectorImpl(_bindings);
    derivationPath = TWDerivationPathImpl(_bindings);
    derivationPathIndex = TWDerivationPathIndexImpl(_bindings);
    ethereumAbiFunction = TWEthereumAbiFunctionImpl(_bindings);
    ethereumAbi = TWEthereumAbiImpl(_bindings);
    ethereumAbiValue = TWEthereumAbiValueImpl(_bindings);
    ethereum = TWEthereumImpl(_bindings);
    ethereumMessageSigner = TWEthereumMessageSignerImpl(_bindings);
    ethereumRlp = TWEthereumRlpImpl(_bindings);
    filecoinAddressConverter = TWFilecoinAddressConverterImpl(_bindings);
    fioAccount = TWFIOAccountImpl(_bindings);
    groestlcoinAddress = TWGroestlcoinAddressImpl(_bindings);
    hash = TWHashImpl(_bindings);
    hdVersion = TWHDVersionImpl(_bindings);
    hdWallet = TWHDWalletImpl(_bindings);
    hrp = TWHRPImpl(_bindings);
    liquidStaking = TWLiquidStakingImpl(_bindings);
    mnemonic = TWMnemonicImpl(_bindings);
    nearAccount = TWNEARAccountImpl(_bindings);
    nervosAddress = TWNervosAddressImpl(_bindings);
    pbkdf2 = TWPBKDF2Impl(_bindings);
    privateKey = TWPrivateKeyImpl(_bindings);
    publicKey = TWPublicKeyImpl(_bindings);
    rippleXAddress = TWRippleXAddressImpl(_bindings);
    segwitAddress = TWSegwitAddressImpl(_bindings);
    solanaAddress = TWSolanaAddressImpl(_bindings);
    solanaTransaction = TWSolanaTransactionImpl(_bindings);
    starkExMessageSigner = TWStarkExMessageSignerImpl(_bindings);
    starkWare = TWStarkWareImpl(_bindings);
    storedKey = TWStoredKeyImpl(_bindings);
    string = TWStringImpl(_bindings);
    tezosMessageSigner = TWTezosMessageSignerImpl(_bindings);
    thorChainSwap = TWTHORChainSwapImpl(_bindings);
    tonAddressConverter = TWTONAddressConverterImpl(_bindings);
    tonWallet = TWTONWalletImpl(_bindings);
    tonMessageSigner = TWTONMessageSignerImpl(_bindings);
    transactionCompiler = TWTransactionCompilerImpl(_bindings);
    transactionDecoder = TWTransactionDecoderImpl(_bindings);
    tronMessageSigner = TWTronMessageSignerImpl(_bindings);
    walletConnectRequest = TWWalletConnectRequestImpl(_bindings);
    webAuthn = TWWebAuthnImpl(_bindings);
    WalletCoreBindingsInterface.instance = this;
  }
}

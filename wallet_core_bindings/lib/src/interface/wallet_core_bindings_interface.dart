part of '../../wallet_core_bindings.dart';

/// WalletCore bindings interface.
abstract class WalletCoreBindingsInterface {
  /// [TWAccount] interface.
  late TWAccountInterface account;

  /// [TWAES] interface.
  late TWAESInterface aes;

  /// [TWAnyAddress] interface.
  late TWAnyAddressInterface anyAddress;

  /// [TWAnySigner] interface.
  late TWAnySignerInterface anySigner;

  /// [TWAsnParser] interface.
  late TWAsnParserInterface asnParser;

  /// [TWBarz] interface.
  late TWBarzInterface barz;

  /// [TWBase32] interface.
  late TWBase32Interface base32;

  /// [TWBase58] interface.
  late TWBase58Interface base58;

  /// [TWBase64] interface.
  late TWBase64Interface base64;

  /// [TWBitcoinAddress] interface.
  late TWBitcoinAddressInterface bitcoinAddress;

  /// [TWBitcoinMessageSigner] interface.
  late TWBitcoinMessageSignerInterface bitcoinMessageSigner;

  /// [TWBitcoinScript] interface.
  late TWBitcoinScriptInterface bitcoinScript;

  /// [TWBitcoinSigHashType] interface.
  late TWBitcoinSigHashTypeInterface bitcoinSigHashType;

  /// [TWCardano] interface;
  late TWCardanoInterface cardano;

  /// [TWCoinType] interface.
  late TWCoinTypeInterface coinType;

  /// [TWCoinTypeConfiguration] interface.
  late TWCoinTypeConfigurationInterface coinTypeConfiguration;

  /// [TWCryptoBox] interface.
  late TWCryptoBoxInterface cryptoBox;

  /// [TWCryptoBoxSecretKey] interface.
  late TWCryptoBoxSecretKeyInterface cryptoBoxSecretKey;

  /// [TWCryptoBoxPublicKey] interface.
  late TWCryptoBoxPublicKeyInterface cryptoBoxPublicKey;

  /// [TWData] interface.
  late TWDataInterface data;

  /// [TWDataVector] interface.
  late TWDataVectorInterface dataVector;

  /// [TWDerivationPath] interface.
  late TWDerivationPathInterface derivationPath;

  /// [TWDerivationPathIndex] interface.
  late TWDerivationPathIndexInterface derivationPathIndex;

  /// [TWEthereum] interface.
  late TWEthereumInterface ethereum;

  /// [TWEthereumAbi] interface.
  late TWEthereumAbiInterface ethereumAbi;

  /// [TWEthereumAbiFunction] interface.
  late TWEthereumAbiFunctionInterface ethereumAbiFunction;

  /// [TWEthereumAbiValue] interface.
  late TWEthereumAbiValueInterface ethereumAbiValue;

  /// [TWEthereumMessageSigner] interface.
  late TWEthereumMessageSignerInterface ethereumMessageSigner;

  /// [TWEthereumRlp] interface.
  late TWEthereumRlpInterface ethereumRlp;

  /// [TWFilecoinAddressConverter] interface.
  late TWFilecoinAddressConverterInterface filecoinAddressConverter;

  /// [TWFIOAccount] interface.
  late TWFIOAccountInterface fioAccount;

  /// [TWGroestlcoinAddress] interface.
  late TWGroestlcoinAddressInterface groestlcoinAddress;

  /// [TWHash] interface.
  late TWHashInterface hash;

  /// [TWHDWallet] interface.
  late TWHDWalletInterface hdWallet;

  /// [TWHDVersion] interface.
  late TWHDVersionInterface hdVersion;

  /// [TWHRP] interface.
  late TWHRPInterface hrp;

  /// [TWLiquidStaking] interface.
  late TWLiquidStakingInterface liquidStaking;

  /// [TWMnemonic] interface.
  late TWMnemonicInterface mnemonic;

  /// [TWNEARAccount] interface.
  late TWNEARAccountInterface nearAccount;

  /// [TWNervosAddress] interface.
  late TWNervosAddressInterface nervosAddress;

  /// [TWPBKDF2] interface.
  late TWPBKDF2Interface pbkdf2;

  /// [TWPrivateKey] interface.
  late TWPrivateKeyInterface privateKey;

  /// [TWPublicKey] interface.
  late TWPublicKeyInterface publicKey;

  /// [TWRippleXAddress] interface.
  late TWRippleXAddressInterface rippleXAddress;

  /// [TWSegwitAddress] interface.
  late TWSegwitAddressInterface segwitAddress;

  /// [TWSolanaAddress] interface.
  late TWSolanaAddressInterface solanaAddress;

  /// [TWSolanaTransaction] interface.
  late TWSolanaTransactionInterface solanaTransaction;

  /// [TWStarkExMessageSigner] interface.
  late TWStarkExMessageSignerInterface starkExMessageSigner;

  /// [TWStarkWare] interface.
  late TWStarkWareInterface starkWare;

  /// [TWStoredKey] interface.
  late TWStoredKeyInterface storedKey;

  /// [TWString] interface.
  late TWStringInterface string;

  /// [TWTezosMessageSigner] interface.
  late TWTezosMessageSignerInterface tezosMessageSigner;

  /// [TWTHORChainSwap] interface.
  late TWTHORChainSwapInterface thorChainSwap;

  /// [TWTONAddressConverter] interface.
  late TWTONAddressConverterInterface tonAddressConverter;

  /// [TwTonMessageSigner] interface.
  late TWTONMessageSignerInterface tonMessageSigner;

  /// [TWTONWallet] interface.
  late TWTONWalletInterface tonWallet;

  /// [TWTransactionCompiler] interface.
  late TWTransactionCompilerInterface transactionCompiler;

  /// [TWTransactionDecoder] interface.
  late TWTransactionDecoderInterface transactionDecoder;

  /// [TWTronMessageSigner] interface.
  late TWTronMessageSignerInterface tronMessageSigner;

  /// [TWWalletConnectRequest] interface.
  late TWWalletConnectRequestInterface walletConnectRequest;

  /// [TWWebAuthn] interface.
  late TWWebAuthnInterface webAuthn;

  /// WalletCore bindings instance.
  static WalletCoreBindingsInterface? _instance;

  /// Get WalletCore bindings instance.
  static WalletCoreBindingsInterface get instance {
    assert(_instance != null, 'Please initialize the instance.');
    return _instance!;
  }

  /// Set WalletCore bindings instance.
  static set instance(WalletCoreBindingsInterface instance) {
    _instance = instance;
  }

  /// Initializes the bindings.
  /// This should be called before using any of the bindings.
  ///
  /// example:
  /// ```dart
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await WalletCoreBindingsNativeImpl().initialize();
  ///   runApp(const MyApp());
  /// }
  /// ```
  Future initialize();
}

/// [TWAccount] implement.
TWAccountInterface get _accountImpl =>
    WalletCoreBindingsInterface.instance.account;

/// [TWAnyAddress] implement.
TWAnyAddressInterface get _anyAddressImpl =>
    WalletCoreBindingsInterface.instance.anyAddress;

/// [TWAES] implement.
TWAESInterface get _aesImpl => WalletCoreBindingsInterface.instance.aes;

/// [TWAnySigner] implement.
TWAnySignerInterface get _anySignerImpl =>
    WalletCoreBindingsInterface.instance.anySigner;

/// [TWAsnParser] implement.
TWAsnParserInterface get _asnParserImpl =>
    WalletCoreBindingsInterface.instance.asnParser;

/// [TWBarz] implement.
TWBarzInterface get _barzImpl => WalletCoreBindingsInterface.instance.barz;

/// [TWBase32] implement.
TWBase32Interface get _base32Impl =>
    WalletCoreBindingsInterface.instance.base32;

/// [TWBase58] implement.
TWBase58Interface get _base58Impl =>
    WalletCoreBindingsInterface.instance.base58;

/// [TWBase64] implement.
TWBase64Interface get _base64Impl =>
    WalletCoreBindingsInterface.instance.base64;

/// [TWBitcoinAddress] implement.
TWBitcoinAddressInterface get _bitcoinAddressImpl =>
    WalletCoreBindingsInterface.instance.bitcoinAddress;

/// [TWBitcoinMessageSigner] implement.
TWBitcoinMessageSignerInterface get _bitcoinMessageSignerImpl =>
    WalletCoreBindingsInterface.instance.bitcoinMessageSigner;

/// [TWBitcoinScript] implement.
TWBitcoinScriptInterface get _bitcoinScriptImpl =>
    WalletCoreBindingsInterface.instance.bitcoinScript;

/// [TWBitcoinSigHashType] implement.
TWBitcoinSigHashTypeInterface get _bitcoinSigHashTypeImpl =>
    WalletCoreBindingsInterface.instance.bitcoinSigHashType;

/// [TWCardano] implement.
TWCardanoInterface get _cardanoImpl =>
    WalletCoreBindingsInterface.instance.cardano;

/// [TWCoinType] implement.
TWCoinTypeInterface get _coinTypeImpl =>
    WalletCoreBindingsInterface.instance.coinType;

/// [TWCoinTypeConfiguration] implement.
TWCoinTypeConfigurationInterface get _coinTypeConfigurationImpl =>
    WalletCoreBindingsInterface.instance.coinTypeConfiguration;

/// [TWCryptoBox] implement.
TWCryptoBoxInterface get _cryptoBoxImpl =>
    WalletCoreBindingsInterface.instance.cryptoBox;

/// [TWCryptoBoxSecretKey] implement.
TWCryptoBoxSecretKeyInterface get _cryptoBoxSecretKeyImpl =>
    WalletCoreBindingsInterface.instance.cryptoBoxSecretKey;

/// [TWCryptoBoxPublicKey] implement.
TWCryptoBoxPublicKeyInterface get _cryptoBoxPublicKeyImpl =>
    WalletCoreBindingsInterface.instance.cryptoBoxPublicKey;

/// [TWData] implement.
TWDataInterface get _dataImpl => WalletCoreBindingsInterface.instance.data;

/// [TWDataVector] implement.
TWDataVectorInterface get _dataVectorImpl =>
    WalletCoreBindingsInterface.instance.dataVector;

/// [TWDerivationPath] implement.
TWDerivationPathInterface get _derivationPathImpl =>
    WalletCoreBindingsInterface.instance.derivationPath;

/// [TWDerivationPathIndex] implement.
TWDerivationPathIndexInterface get _derivationPathIndexImpl =>
    WalletCoreBindingsInterface.instance.derivationPathIndex;

/// [TWEthereum] implement.
TWEthereumInterface get _ethereumImpl =>
    WalletCoreBindingsInterface.instance.ethereum;

/// [TWEthereumAbi] implement.
TWEthereumAbiInterface get _ethereumAbiImpl =>
    WalletCoreBindingsInterface.instance.ethereumAbi;

/// [TWEthereumAbiFunction] implement.
TWEthereumAbiFunctionInterface get _ethereumAbiFunctionImpl =>
    WalletCoreBindingsInterface.instance.ethereumAbiFunction;

/// [TWEthereumAbiValue] implement.
TWEthereumAbiValueInterface get _ethereumAbiValueImpl =>
    WalletCoreBindingsInterface.instance.ethereumAbiValue;

/// [TWEthereumMessageSigner] implement.
TWEthereumMessageSignerInterface get _ethereumMessageSignerImpl =>
    WalletCoreBindingsInterface.instance.ethereumMessageSigner;

/// [TWEthereumRlp] implement.
TWEthereumRlpInterface get _ethereumRlpImpl =>
    WalletCoreBindingsInterface.instance.ethereumRlp;

/// [TWFilecoinAddressConverter] implement.
TWFilecoinAddressConverterInterface get _filecoinAddressConverterImpl =>
    WalletCoreBindingsInterface.instance.filecoinAddressConverter;

/// [TWFIOAccount] implement.
TWFIOAccountInterface get _fioAccountImpl =>
    WalletCoreBindingsInterface.instance.fioAccount;

/// [TWGroestlcoinAddress] implement.
TWGroestlcoinAddressInterface get _groestlcoinAddressImpl =>
    WalletCoreBindingsInterface.instance.groestlcoinAddress;

/// [TWHash] implement.
TWHashInterface get _hashImpl => WalletCoreBindingsInterface.instance.hash;

/// [TWHDWallet] implement.
TWHDWalletInterface get _hdWalletImpl =>
    WalletCoreBindingsInterface.instance.hdWallet;

/// [TWHDVersion] implement.
TWHDVersionInterface get _hdVersionImpl =>
    WalletCoreBindingsInterface.instance.hdVersion;

/// [TWHRP] implement.
TWHRPInterface get _hrpImpl => WalletCoreBindingsInterface.instance.hrp;

/// [TWLiquidStaking] implement.
TWLiquidStakingInterface get _liquidStakingImpl =>
    WalletCoreBindingsInterface.instance.liquidStaking;

/// [TWMnemonic] implement.
TWMnemonicInterface get _mnemonicImpl =>
    WalletCoreBindingsInterface.instance.mnemonic;

/// [TWNEARAccount] implement.
TWNEARAccountInterface get _nearAccountImpl =>
    WalletCoreBindingsInterface.instance.nearAccount;

/// [TWNervosAddress] implement.
TWNervosAddressInterface get _nervosAddressImpl =>
    WalletCoreBindingsInterface.instance.nervosAddress;

/// [TWPBKDF2] implement.
TWPBKDF2Interface get _pbkdf2Impl =>
    WalletCoreBindingsInterface.instance.pbkdf2;

/// [TWPrivateKey] implement.
TWPrivateKeyInterface get _privateKeyImpl =>
    WalletCoreBindingsInterface.instance.privateKey;

/// [TWPublicKey] implement.
TWPublicKeyInterface get _publicKeyImpl =>
    WalletCoreBindingsInterface.instance.publicKey;

/// [TWRippleXAddress] implement.
TWRippleXAddressInterface get _rippleXAddressImpl =>
    WalletCoreBindingsInterface.instance.rippleXAddress;

/// [TWSegwitAddress] implement.
TWSegwitAddressInterface get _segwitAddressImpl =>
    WalletCoreBindingsInterface.instance.segwitAddress;

/// [TWSolanaAddress] implement.
TWSolanaAddressInterface get _solanaAddressImpl =>
    WalletCoreBindingsInterface.instance.solanaAddress;

/// [TWSolanaTransaction] implement.
TWSolanaTransactionInterface get _solanaTransactionImpl =>
    WalletCoreBindingsInterface.instance.solanaTransaction;

/// [TWStarkExMessageSigner] implement.
TWStarkExMessageSignerInterface get _starkExMessageSignerImpl =>
    WalletCoreBindingsInterface.instance.starkExMessageSigner;

/// [TWStarkWare] implement.
TWStarkWareInterface get _starkWareImpl =>
    WalletCoreBindingsInterface.instance.starkWare;

/// [TWStoredKey] implement.
TWStoredKeyInterface get _storedKeyImpl =>
    WalletCoreBindingsInterface.instance.storedKey;

/// [TWString] implement.
TWStringInterface get _stringImpl =>
    WalletCoreBindingsInterface.instance.string;

/// [TWTezosMessageSigner] implement.
TWTezosMessageSignerInterface get _tezosMessageSignerImpl =>
    WalletCoreBindingsInterface.instance.tezosMessageSigner;

/// [TWTHORChainSwap] implement.
TWTHORChainSwapInterface get _thorChainSwapImpl =>
    WalletCoreBindingsInterface.instance.thorChainSwap;

/// [TWTONAddressConverter] implement.
TWTONAddressConverterInterface get _tonAddressConverterImpl =>
    WalletCoreBindingsInterface.instance.tonAddressConverter;

/// [TWTonMessageSigner] implement.
TWTONMessageSignerInterface get _tonMessageSignerImpl =>
    WalletCoreBindingsInterface.instance.tonMessageSigner;

/// [TWTONWallet] implement.
TWTONWalletInterface get _tonWalletImpl =>
    WalletCoreBindingsInterface.instance.tonWallet;

/// [TWTransactionCompiler] implement.
TWTransactionCompilerInterface get _transactionCompilerImpl =>
    WalletCoreBindingsInterface.instance.transactionCompiler;

/// [TWTransactionDecoder] implement.
TWTransactionDecoderInterface get _transactionDecoderImpl =>
    WalletCoreBindingsInterface.instance.transactionDecoder;

/// [TWTronMessageSigner] implement.
TWTronMessageSignerInterface get _tronMessageSignerImpl =>
    WalletCoreBindingsInterface.instance.tronMessageSigner;

/// [TWWalletConnectRequest] implement.
TWWalletConnectRequestInterface get _walletConnectRequestImpl =>
    WalletCoreBindingsInterface.instance.walletConnectRequest;

/// [TWWebAuthn] implement.
TWWebAuthnInterface get _webAuthnImpl =>
    WalletCoreBindingsInterface.instance.webAuthn;
